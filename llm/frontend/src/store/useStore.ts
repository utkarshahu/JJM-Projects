import { create } from 'zustand'

export interface Source {
  id: number
  url: string | null
  title: string | null
  source_type: string
  status: string
  created_at: string
}

export interface SchemaMetadata {
  id: number
  source_id: number
  schema_name: string
  schema_json: Record<string, string>
  created_at: string
}

export interface ExtractionRecord {
  id: number
  source_id: number
  record_type: string
  data_json: Record<string, any>
  created_at: string
}

export interface QueryHistoryItem {
  id: number
  user_query: string
  generated_sql: string
  execution_time: number
  created_at: string
}

export interface AppSettings {
  has_gemini_api_key: boolean
  api_key_masked: string
  max_depth: number
  max_pages: number
  upload_directory: string
  mysql_database: string
}

interface AppState {
  // Navigation
  activeTab: string
  setActiveTab: (tab: string) => void

  // Data lists
  sources: Source[]
  schemas: SchemaMetadata[]
  records: ExtractionRecord[]
  queryHistory: QueryHistoryItem[]
  settings: AppSettings | null
  
  // Loading states
  loadingSources: boolean
  loadingSchemas: boolean
  loadingRecords: boolean
  loadingSettings: boolean
  submittingSource: boolean
  
  // Active queries and results
  queryResult: any | null
  queryLoading: boolean
  queryError: string | null
  
  // Analytics
  analyticsResult: any | null
  analyticsLoading: boolean
  analyticsError: string | null

  // API Methods
  fetchSources: () => Promise<void>
  fetchSchemas: () => Promise<void>
  fetchRecords: (sourceId?: number, recordType?: string) => Promise<void>
  fetchQueryHistory: () => Promise<void>
  fetchSettings: () => Promise<void>
  
  deleteSource: (id: number) => Promise<void>
  submitUrl: (url: string, crawl: boolean, maxDepth?: number, maxPages?: number) => Promise<Source>
  submitFile: (file: File) => Promise<Source>
  updateSettings: (apiKey: string, maxDepth: number, maxPages: number) => Promise<void>
  
  runQuery: (query: string) => Promise<void>
  runAnalytics: (query: string) => Promise<void>
  clearQueryError: () => void
}

export const useStore = create<AppState>((set, get) => ({
  activeTab: 'dashboard',
  setActiveTab: (tab: string) => set({ activeTab: tab }),

  sources: [],
  schemas: [],
  records: [],
  queryHistory: [],
  settings: null,
  
  loadingSources: false,
  loadingSchemas: false,
  loadingRecords: false,
  loadingSettings: false,
  submittingSource: false,
  
  queryResult: null,
  queryLoading: false,
  queryError: null,
  
  analyticsResult: null,
  analyticsLoading: false,
  analyticsError: null,

  fetchSources: async () => {
    set({ loadingSources: true })
    try {
      const res = await fetch('/api/sources')
      const data = await res.json()
      set({ sources: data, loadingSources: false })
    } catch (err) {
      console.error("Failed to fetch sources", err)
      set({ loadingSources: false })
    }
  },

  fetchSchemas: async () => {
    set({ loadingSchemas: true })
    try {
      const res = await fetch('/api/schemas')
      const data = await res.json()
      set({ schemas: data, loadingSchemas: false })
    } catch (err) {
      console.error("Failed to fetch schemas", err)
      set({ loadingSchemas: false })
    }
  },

  fetchRecords: async (sourceId?: number, recordType?: string) => {
    set({ loadingRecords: true })
    try {
      let url = '/api/records?limit=250'
      if (sourceId) url += `&source_id=${sourceId}`
      if (recordType) url += `&record_type=${recordType}`
      const res = await fetch(url)
      const data = await res.json()
      set({ records: data, loadingRecords: false })
    } catch (err) {
      console.error("Failed to fetch records", err)
      set({ loadingRecords: false })
    }
  },

  fetchQueryHistory: async () => {
    try {
      const res = await fetch('/api/query-history')
      const data = await res.json()
      set({ queryHistory: data })
    } catch (err) {
      console.error("Failed to fetch query history", err)
    }
  },

  fetchSettings: async () => {
    set({ loadingSettings: true })
    try {
      const res = await fetch('/api/settings')
      const data = await res.json()
      set({ settings: data, loadingSettings: false })
    } catch (err) {
      console.error("Failed to fetch settings", err)
      set({ loadingSettings: false })
    }
  },

  deleteSource: async (id: number) => {
    try {
      await fetch(`/api/sources/${id}`, { method: 'DELETE' })
      set(state => ({
        sources: state.sources.filter(s => s.id !== id),
        records: state.records.filter(r => r.source_id !== id),
        schemas: state.schemas.filter(s => s.source_id !== id)
      }))
    } catch (err) {
      console.error("Failed to delete source", err)
    }
  },

  submitUrl: async (url: string, crawl: boolean, maxDepth = 2, maxPages = 10) => {
    set({ submittingSource: true })
    try {
      const res = await fetch('/api/extract/url', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ url, crawl, max_depth: maxDepth, max_pages: maxPages })
      })
      if (!res.ok) throw new Error("Url extraction failed")
      const newSource = await res.json()
      set(state => ({
        sources: [newSource, ...state.sources],
        submittingSource: false
      }))
      return newSource
    } catch (err) {
      set({ submittingSource: false })
      throw err
    }
  },

  submitFile: async (file: File) => {
    set({ submittingSource: true })
    try {
      const formData = new FormData()
      formData.append('file', file)
      const res = await fetch('/api/extract/file', {
        method: 'POST',
        body: formData
      })
      if (!res.ok) throw new Error("File extraction failed")
      const newSource = await res.json()
      set(state => ({
        sources: [newSource, ...state.sources],
        submittingSource: false
      }))
      return newSource
    } catch (err) {
      set({ submittingSource: false })
      throw err
    }
  },

  updateSettings: async (apiKey: string, maxDepth: number, maxPages: number) => {
    try {
      const formData = new FormData()
      if (apiKey) formData.append('gemini_api_key', apiKey)
      formData.append('max_depth', String(maxDepth))
      formData.append('max_pages', String(maxPages))
      
      const res = await fetch('/api/settings', {
        method: 'POST',
        body: formData
      })
      if (!res.ok) throw new Error("Failed to save settings")
      
      // Refresh local settings state
      await get().fetchSettings()
    } catch (err) {
      console.error(err)
      throw err
    }
  },

  runQuery: async (query: string) => {
    set({ queryLoading: true, queryError: null, queryResult: null })
    try {
      const res = await fetch('/api/query', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query })
      })
      const data = await res.json()
      if (!res.ok) {
        throw new Error(data.detail || "Query translation or execution failed")
      }
      if (!data.success && data.error) {
        throw new Error(data.error)
      }
      set({ queryResult: data, queryLoading: false })
      // Update history list in background
      get().fetchQueryHistory()
    } catch (err: any) {
      set({ queryError: err.message || "An unknown error occurred", queryLoading: false })
    }
  },

  runAnalytics: async (query: string) => {
    set({ analyticsLoading: true, analyticsError: null, analyticsResult: null })
    try {
      const res = await fetch('/api/analytics', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query })
      })
      const data = await res.json()
      if (!res.ok) {
        throw new Error(data.detail || "Analytics generation failed")
      }
      set({ analyticsResult: data, analyticsLoading: false })
    } catch (err: any) {
      set({ analyticsError: err.message || "Failed to analyze data", analyticsLoading: false })
    }
  },

  clearQueryError: () => set({ queryError: null })
}))
