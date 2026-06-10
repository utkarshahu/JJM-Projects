import React, { useEffect, useState, useRef } from 'react'
import { useStore } from '../store/useStore'
import { 
  Plus, 
  Link as LinkIcon, 
  Upload, 
  Trash2, 
  Loader2, 
  File, 
  Search, 
  Layers, 
  AlertCircle 
} from 'lucide-react'

export const Sources: React.FC = () => {
  const { 
    sources, 
    loadingSources,
    submittingSource,
    fetchSources, 
    submitUrl, 
    submitFile, 
    deleteSource 
  } = useStore()

  // URL Form States
  const [url, setUrl] = useState('')
  const [crawl, setCrawl] = useState(false)
  const [maxDepth, setMaxDepth] = useState(2)
  const [maxPages, setMaxPages] = useState(10)
  const [urlError, setUrlError] = useState('')
  const [urlSuccess, setUrlSuccess] = useState(false)

  // File Form States
  const fileInputRef = useRef<HTMLInputElement>(null)
  const [dragging, setDragging] = useState(false)
  const [selectedFile, setSelectedFile] = useState<File | null>(null)
  const [fileError, setFileError] = useState('')
  const [fileSuccess, setFileSuccess] = useState(false)

  // Search State
  const [searchTerm, setSearchTerm] = useState('')

  useEffect(() => {
    fetchSources()
  }, [])

  const handleUrlSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setUrlError('')
    setUrlSuccess(false)
    if (!url.trim()) return

    try {
      new URL(url) // regex/url parsing
      await submitUrl(url, crawl, maxDepth, maxPages)
      setUrlSuccess(true)
      setUrl('')
      setCrawl(false)
      setTimeout(() => setUrlSuccess(false), 3000)
    } catch (err: any) {
      setUrlError(err.message || 'Please enter a valid absolute URL (include http:// or https://)')
    }
  }

  const handleDragOver = (e: React.DragEvent) => {
    e.preventDefault()
    setDragging(true)
  }

  const handleDragLeave = () => {
    setDragging(false)
  }

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault()
    setDragging(false)
    setFileError('')
    setFileSuccess(false)
    
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      validateAndSetFile(e.dataTransfer.files[0])
    }
  }

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFileError('')
    setFileSuccess(false)
    if (e.target.files && e.target.files[0]) {
      validateAndSetFile(e.target.files[0])
    }
  }

  const validateAndSetFile = (file: File) => {
    const ext = file.name.split('.').pop()?.toLowerCase()
    const allowed = ['pdf', 'csv', 'xlsx', 'xls', 'json', 'xml', 'html', 'htm']
    
    if (!ext || !allowed.includes(ext)) {
      setFileError('Invalid file type. Supported formats: PDF, CSV, Excel, JSON, XML, HTML')
      return
    }

    if (file.size > 15 * 1024 * 1024) {
      setFileError('File size exceeds 15MB limit.')
      return
    }

    setSelectedFile(file)
  }

  const handleFileSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!selectedFile) return
    setFileError('')
    setFileSuccess(false)

    try {
      await submitFile(selectedFile)
      setFileSuccess(true)
      setSelectedFile(null)
      if (fileInputRef.current) fileInputRef.current.value = ''
      setTimeout(() => setFileSuccess(false), 3000)
    } catch (err: any) {
      setFileError(err.message || 'File ingestion failed.')
    }
  }

  // Filter sources
  const filteredSources = sources.filter(s => {
    const titleMatch = s.title?.toLowerCase().includes(searchTerm.toLowerCase())
    const urlMatch = s.url?.toLowerCase().includes(searchTerm.toLowerCase())
    const typeMatch = s.source_type.toLowerCase().includes(searchTerm.toLowerCase())
    const statusMatch = s.status.toLowerCase().includes(searchTerm.toLowerCase())
    return titleMatch || urlMatch || typeMatch || statusMatch
  })

  return (
    <div className="flex-1 flex flex-col min-h-0 space-y-6 overflow-y-auto pr-2">
      {/* Top Title */}
      <div>
        <h2 className="font-display font-bold text-3xl text-white">Data Ingestion Center</h2>
        <p className="text-muted-foreground text-sm">Add data sources by submitting URLs for scraping/crawling or uploading raw data files.</p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* URL Scraping panel */}
        <div className="glass-card p-6 rounded-2xl border border-border flex flex-col justify-between">
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-primary">
              <LinkIcon size={20} />
              <h3 className="font-display font-bold text-lg text-white">Web Scraping & Crawling</h3>
            </div>
            
            <form onSubmit={handleUrlSubmit} className="space-y-4">
              <div>
                <label className="block text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-2">Target URL</label>
                <input
                  type="text"
                  value={url}
                  onChange={(e) => setUrl(e.target.value)}
                  placeholder="https://example.com/pollution-data"
                  className="w-full px-4 py-2.5 rounded-xl bg-black/40 border border-border text-sm text-foreground focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition-all"
                />
                {urlError && <span className="text-xs text-rose-400 mt-1 block">{urlError}</span>}
                {urlSuccess && <span className="text-xs text-emerald-400 mt-1 block">Scrape job enqueued successfully!</span>}
              </div>

              <div className="flex items-center gap-3 bg-black/20 p-3 rounded-xl border border-border/40">
                <input
                  type="checkbox"
                  id="crawl"
                  checked={crawl}
                  onChange={(e) => setCrawl(e.target.checked)}
                  className="w-4 h-4 rounded border-border bg-slate-900 text-primary focus:ring-primary"
                />
                <div className="text-xs">
                  <label htmlFor="crawl" className="font-semibold text-white cursor-pointer select-none">Recursively Crawl Website</label>
                  <p className="text-muted-foreground">Scrape links in the same domain up to specified depth.</p>
                </div>
              </div>

              {crawl && (
                <div className="grid grid-cols-2 gap-4 animate-fade-in">
                  <div>
                    <label className="block text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-1.5">Max Crawl Depth</label>
                    <input
                      type="number"
                      min={1}
                      max={4}
                      value={maxDepth}
                      onChange={(e) => setMaxDepth(Number(e.target.value))}
                      className="w-full px-3 py-2 rounded-lg bg-black/40 border border-border text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-1.5">Max Page Limit</label>
                    <input
                      type="number"
                      min={1}
                      max={50}
                      value={maxPages}
                      onChange={(e) => setMaxPages(Number(e.target.value))}
                      className="w-full px-3 py-2 rounded-lg bg-black/40 border border-border text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                    />
                  </div>
                </div>
              )}

              <button
                type="submit"
                disabled={submittingSource}
                className="w-full flex items-center justify-center gap-2 py-2.5 rounded-xl bg-primary text-primary-foreground text-sm font-semibold transition-all hover:bg-primary/95 disabled:opacity-50"
              >
                {submittingSource ? (
                  <>
                    <Loader2 size={16} className="animate-spin" /> Enqueueing Job...
                  </>
                ) : (
                  <>
                    <Plus size={16} /> Submit Ingestion Request
                  </>
                )}
              </button>
            </form>
          </div>
        </div>

        {/* File Ingestion panel */}
        <div className="glass-card p-6 rounded-2xl border border-border flex flex-col justify-between">
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-violet-400">
              <Upload size={20} />
              <h3 className="font-display font-bold text-lg text-white">Document & File Uploads</h3>
            </div>

            <form onSubmit={handleFileSubmit} className="space-y-4">
              <div
                onDragOver={handleDragOver}
                onDragLeave={handleDragLeave}
                onDrop={handleDrop}
                onClick={() => fileInputRef.current?.click()}
                className={`border-2 border-dashed rounded-2xl p-8 text-center cursor-pointer transition-all flex flex-col items-center justify-center ${
                  dragging 
                    ? 'border-primary bg-primary/10' 
                    : 'border-border/60 hover:border-violet-500/50 hover:bg-white/5'
                }`}
              >
                <input
                  type="file"
                  ref={fileInputRef}
                  onChange={handleFileChange}
                  className="hidden"
                  accept=".pdf,.csv,.xlsx,.xls,.json,.xml,.html,.htm"
                />
                
                {selectedFile ? (
                  <div className="space-y-2 animate-fade-in">
                    <div className="p-3 bg-violet-500/10 rounded-xl text-violet-400 w-fit mx-auto">
                      <File size={32} />
                    </div>
                    <p className="text-sm font-semibold text-white max-w-xs truncate">{selectedFile.name}</p>
                    <p className="text-[10px] text-muted-foreground">{(selectedFile.size / 1024 / 1024).toFixed(2)} MB</p>
                  </div>
                ) : (
                  <div className="space-y-2">
                    <div className="p-3 bg-slate-900 rounded-xl text-muted-foreground border border-border w-fit mx-auto">
                      <Upload size={24} />
                    </div>
                    <p className="text-sm font-semibold text-white">Drag & drop files here</p>
                    <p className="text-xs text-muted-foreground">Or click to browse from explorer</p>
                  </div>
                )}
              </div>

              {fileError && (
                <div className="flex items-center gap-1.5 text-xs text-rose-400">
                  <AlertCircle size={14} />
                  <span>{fileError}</span>
                </div>
              )}
              {fileSuccess && <span className="text-xs text-emerald-400 mt-1 block">File extraction job scheduled successfully!</span>}

              {selectedFile && (
                <button
                  type="submit"
                  disabled={submittingSource}
                  className="w-full flex items-center justify-center gap-2 py-2.5 rounded-xl bg-violet-600 hover:bg-violet-500 text-white text-sm font-semibold transition-all disabled:opacity-50"
                >
                  {submittingSource ? (
                    <>
                      <Loader2 size={16} className="animate-spin" /> Uploading & Parsing...
                    </>
                  ) : (
                    <>
                      <Upload size={16} /> Process Uploaded File
                    </>
                  )}
                </button>
              )}
            </form>
          </div>
          <div className="text-[10px] text-muted-foreground/60 text-center mt-3">
            Supported extensions: .pdf, .csv, .xlsx, .json, .xml, .html
          </div>
        </div>
      </div>

      {/* Grid of Ingested Sources */}
      <div className="glass-card p-6 rounded-2xl border border-border flex flex-col min-h-0 flex-1">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-6">
          <div className="flex items-center gap-2">
            <Layers size={18} className="text-primary" />
            <h4 className="font-display font-bold text-lg text-white">Ingested Sources Register</h4>
          </div>
          
          <div className="relative max-w-sm w-full">
            <span className="absolute inset-y-0 left-0 pl-3 flex items-center text-muted-foreground pointer-events-none">
              <Search size={14} />
            </span>
            <input
              type="text"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              placeholder="Search sources (title, type, status)..."
              className="w-full pl-9 pr-4 py-1.5 rounded-xl bg-black/40 border border-border text-xs text-foreground focus:outline-none focus:ring-1 focus:ring-primary focus:border-transparent placeholder:text-muted-foreground/50"
            />
          </div>
        </div>

        {/* Datagrid Table */}
        <div className="flex-1 overflow-auto rounded-xl border border-border/60">
          {loadingSources ? (
            <div className="flex flex-col items-center justify-center py-20 gap-3">
              <Loader2 size={32} className="animate-spin text-primary" />
              <p className="text-sm text-muted-foreground">Loading ingested sources register...</p>
            </div>
          ) : filteredSources.length === 0 ? (
            <div className="text-center py-20 text-muted-foreground text-sm">
              {sources.length === 0 
                ? "No sources registered. Feed URLs or files to start ingestion." 
                : "No sources match the search term."}
            </div>
          ) : (
            <table className="w-full text-left text-xs border-collapse">
              <thead>
                <tr className="bg-black/40 text-muted-foreground font-semibold border-b border-border uppercase tracking-wider text-[10px]">
                  <th className="p-4">ID</th>
                  <th className="p-4">Title / Filename</th>
                  <th className="p-4">Source Type</th>
                  <th className="p-4">Endpoint / Filepath</th>
                  <th className="p-4">Status</th>
                  <th className="p-4">Created At</th>
                  <th className="p-4 text-center">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-border/40 bg-black/5">
                {filteredSources.map((source) => {
                  const statusColors = {
                    completed: 'bg-emerald-500/10 text-emerald-400 border-emerald-500/20',
                    failed: 'bg-rose-500/10 text-rose-400 border-rose-500/20',
                    processing: 'bg-blue-500/10 text-blue-400 border-blue-500/20',
                    pending: 'bg-yellow-500/10 text-yellow-400 border-yellow-500/20'
                  }[source.status] || 'bg-slate-500/10 text-slate-400 border-slate-500/20'

                  return (
                    <tr key={source.id} className="hover:bg-white/5 transition-colors">
                      <td className="p-4 font-mono font-semibold text-muted-foreground">{source.id}</td>
                      <td className="p-4 font-bold text-white max-w-xs truncate">{source.title || "Processing..."}</td>
                      <td className="p-4">
                        <span className="bg-slate-900 border border-border text-muted-foreground font-mono text-[9px] uppercase px-2 py-0.5 rounded font-semibold">
                          {source.source_type}
                        </span>
                      </td>
                      <td className="p-4 font-mono text-muted-foreground max-w-sm truncate" title={source.url || 'Uploaded document'}>
                        {source.url || 'uploaded_file_source'}
                      </td>
                      <td className="p-4">
                        <span className={`text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded-full border ${statusColors}`}>
                          {source.status}
                        </span>
                      </td>
                      <td className="p-4 text-muted-foreground font-mono">
                        {new Date(source.created_at).toLocaleString([], { dateStyle: 'short', timeStyle: 'short' })}
                      </td>
                      <td className="p-4 text-center">
                        <button
                          onClick={() => deleteSource(source.id)}
                          className="p-1.5 rounded-lg bg-rose-500/10 border border-rose-500/20 text-rose-400 hover:bg-rose-500 hover:text-white transition-colors"
                          title="Delete source and data"
                        >
                          <Trash2 size={14} />
                        </button>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          )}
        </div>
      </div>
    </div>
  )
}
