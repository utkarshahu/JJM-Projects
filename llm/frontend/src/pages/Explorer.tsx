import React, { useEffect, useState } from 'react'
import { useStore, SchemaMetadata, ExtractionRecord } from '../store/useStore'
import { 
  Table as TableIcon, 
  Grid, 
  Code, 
  Download, 
  Eye, 
  SlidersHorizontal,
  ChevronRight,
  Database,
  Search,
  ExternalLink
} from 'lucide-react'

export const Explorer: React.FC = () => {
  const { 
    sources,
    schemas, 
    records, 
    loadingSchemas, 
    loadingRecords, 
    fetchSchemas, 
    fetchRecords 
  } = useStore()

  // Selected state
  const [selectedRecordType, setSelectedRecordType] = useState<string>('')
  const [selectedSourceId, setSelectedSourceId] = useState<string>('all')
  const [viewMode, setViewMode] = useState<'table' | 'card' | 'json'>('table')
  const [searchTerm, setSearchTerm] = useState('')
  
  // Record inspector modal state
  const [inspectingRecord, setInspectingRecord] = useState<ExtractionRecord | null>(null)

  useEffect(() => {
    fetchSchemas()
    fetchRecords()
  }, [])

  // Auto-select first schema on load if none selected
  useEffect(() => {
    if (schemas.length > 0 && !selectedRecordType) {
      setSelectedRecordType(schemas[0].schema_name)
    }
  }, [schemas])

  // Get active schema metadata
  const activeSchema = schemas.find(s => s.schema_name === selectedRecordType)
  const columns = activeSchema ? Object.keys(activeSchema.schema_json) : []

  // Filter records
  const filteredRecords = records.filter(r => {
    const isTypeMatch = r.record_type === selectedRecordType
    const isSourceMatch = selectedSourceId === 'all' || r.source_id === Number(selectedSourceId)
    
    // Search within JSON keys and values
    const matchesSearch = searchTerm === '' || Object.values(r.data_json).some(val => 
      String(val).toLowerCase().includes(searchTerm.toLowerCase())
    )
    
    return isTypeMatch && isSourceMatch && matchesSearch
  })

  // Get source title for records
  const getSourceTitle = (sourceId: number) => {
    const s = sources.find(src => src.id === sourceId)
    return s ? (s.title || s.url) : `Source #${sourceId}`
  }

  // Client side CSV exporter
  const handleExportCSV = () => {
    if (filteredRecords.length === 0 || !selectedRecordType) return
    
    const headers = ['id', 'source_title', ...columns, 'created_at']
    const csvContent = []
    
    // Header
    csvContent.push(headers.join(','))
    
    // Data
    filteredRecords.forEach(r => {
      const row = [
        r.id,
        `"${getSourceTitle(r.source_id).replace(/"/g, '""')}"`,
        ...columns.map(col => {
          const val = r.data_json[col]
          return val === undefined || val === null ? '""' : `"${String(val).replace(/"/g, '""')}"`
        }),
        `"${r.created_at}"`
      ]
      csvContent.push(row.join(','))
    })
    
    const blob = new Blob([csvContent.join('\n')], { type: 'text/csv;charset=utf-8;' })
    const link = document.createElement("a")
    link.href = URL.createObjectURL(blob)
    link.setAttribute("download", `extracted_data_${selectedRecordType.toLowerCase()}.csv`)
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
  }

  return (
    <div className="flex-1 flex flex-col md:flex-row gap-6 min-h-0 overflow-hidden pr-2">
      {/* Sidebar: Schema Selection */}
      <aside className="w-full md:w-64 glass-card p-5 rounded-2xl border border-border shrink-0 flex flex-col min-h-0">
        <div className="flex items-center gap-2 mb-4 text-primary">
          <Database size={16} />
          <h3 className="font-display font-bold text-sm uppercase tracking-wider text-white">Discovered Entities</h3>
        </div>
        
        {loadingSchemas ? (
          <div className="flex-1 flex items-center justify-center py-6">
            <span className="text-xs text-muted-foreground">Loading entity list...</span>
          </div>
        ) : schemas.length === 0 ? (
          <div className="flex-1 flex items-center justify-center text-center p-4">
            <span className="text-xs text-muted-foreground">No dynamic schemas generated yet.</span>
          </div>
        ) : (
          <div className="flex-1 overflow-y-auto space-y-1 pr-1.5">
            {Array.from(new Set(schemas.map(s => s.schema_name))).map(name => {
              const active = selectedRecordType === name
              const count = records.filter(r => r.record_type === name).length
              return (
                <button
                  key={name}
                  onClick={() => setSelectedRecordType(name)}
                  className={`w-full text-left px-3.5 py-2.5 rounded-xl text-xs font-semibold flex items-center justify-between transition-all ${
                    active 
                      ? 'bg-primary text-primary-foreground shadow-md shadow-primary/10' 
                      : 'text-muted-foreground hover:bg-white/5 hover:text-white'
                  }`}
                >
                  <span className="truncate">{name}</span>
                  <span className={`px-2 py-0.5 rounded-full font-mono text-[9px] ${
                    active ? 'bg-white/20 text-white' : 'bg-black/40 text-muted-foreground'
                  }`}>
                    {count} rows
                  </span>
                </button>
              )
            })}
          </div>
        )}
      </aside>

      {/* Main Panel: Data Grid Explorer */}
      <section className="flex-1 glass-card p-6 rounded-2xl border border-border flex flex-col min-h-0 min-w-0">
        {/* Actions & Filters Ribbon */}
        <div className="flex flex-col gap-4 mb-6">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
            <div>
              <h3 className="font-display font-bold text-xl text-white flex items-center gap-2">
                <span>{selectedRecordType || 'No Entity Selected'}</span>
                <span className="text-xs bg-slate-900 border border-border text-primary px-2.5 py-0.5 rounded-full font-mono font-semibold">
                  Entity Schema
                </span>
              </h3>
              <p className="text-xs text-muted-foreground mt-0.5">Explore structure and rows extracted by the intelligence layer.</p>
            </div>
            
            <div className="flex items-center gap-2">
              {/* View Toggles */}
              <div className="bg-black/40 border border-border p-1 rounded-xl flex items-center gap-1">
                <button
                  onClick={() => setViewMode('table')}
                  className={`p-1.5 rounded-lg text-muted-foreground hover:text-white transition-all ${viewMode === 'table' ? 'bg-primary text-white shadow-sm' : ''}`}
                  title="Table View"
                >
                  <TableIcon size={14} />
                </button>
                <button
                  onClick={() => setViewMode('card')}
                  className={`p-1.5 rounded-lg text-muted-foreground hover:text-white transition-all ${viewMode === 'card' ? 'bg-primary text-white shadow-sm' : ''}`}
                  title="Grid Cards"
                >
                  <Grid size={14} />
                </button>
                <button
                  onClick={() => setViewMode('json')}
                  className={`p-1.5 rounded-lg text-muted-foreground hover:text-white transition-all ${viewMode === 'json' ? 'bg-primary text-white shadow-sm' : ''}`}
                  title="Raw JSON Data"
                >
                  <Code size={14} />
                </button>
              </div>

              {/* CSV Exporter */}
              <button
                onClick={handleExportCSV}
                disabled={filteredRecords.length === 0}
                className="flex items-center gap-1.5 bg-black/40 border border-border hover:bg-slate-900 text-white font-semibold text-xs px-3.5 py-2 rounded-xl transition-all disabled:opacity-50"
              >
                <Download size={14} />
                <span className="hidden sm:inline">Export CSV</span>
              </button>
            </div>
          </div>

          {/* Filtering Ribbon */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 bg-black/10 p-3 rounded-xl border border-border/40">
            {/* Search Input */}
            <div className="relative">
              <span className="absolute inset-y-0 left-0 pl-3.5 flex items-center text-muted-foreground pointer-events-none">
                <Search size={12} />
              </span>
              <input
                type="text"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                placeholder="Search rows..."
                className="w-full pl-9 pr-4 py-1.5 rounded-lg bg-black/30 border border-border text-xs text-white focus:outline-none focus:ring-1 focus:ring-primary focus:border-transparent placeholder:text-muted-foreground/50"
              />
            </div>

            {/* Ingestion Source Dropdown */}
            <div className="relative flex items-center">
              <span className="text-[10px] text-muted-foreground absolute left-3 font-semibold uppercase tracking-wider">Source:</span>
              <select
                value={selectedSourceId}
                onChange={(e) => setSelectedSourceId(e.target.value)}
                className="w-full pl-16 pr-3 py-1.5 rounded-lg bg-black/30 border border-border text-xs text-white focus:outline-none focus:ring-1 focus:ring-primary focus:border-transparent appearance-none"
              >
                <option value="all">All Sources</option>
                {sources.map(s => (
                  <option key={s.id} value={s.id}>
                    #{s.id} - {s.title || s.url}
                  </option>
                ))}
              </select>
            </div>

            {/* Metadata Preview */}
            <div className="flex items-center justify-end text-[10px] text-muted-foreground font-mono px-2">
              <span>Showing {filteredRecords.length} of {records.filter(r => r.record_type === selectedRecordType).length} records</span>
            </div>
          </div>
        </div>

        {/* Data Display Area */}
        <div className="flex-1 overflow-auto">
          {loadingRecords ? (
            <div className="flex items-center justify-center py-20">
              <span className="text-sm text-muted-foreground">Loading record indexes...</span>
            </div>
          ) : filteredRecords.length === 0 ? (
            <div className="text-center py-20 text-muted-foreground text-sm border border-dashed border-border/40 rounded-2xl">
              No matching records discovered. Submitting more data or crawling wider domains will populate rows.
            </div>
          ) : viewMode === 'table' ? (
            <div className="overflow-x-auto rounded-xl border border-border/60">
              <table className="w-full text-left text-xs border-collapse">
                <thead>
                  <tr className="bg-black/50 text-muted-foreground font-semibold border-b border-border uppercase tracking-wider text-[10px]">
                    <th className="p-3.5">ID</th>
                    <th className="p-3.5">Source Ingest</th>
                    {columns.map(col => (
                      <th key={col} className="p-3.5">{col.replace(/_/g, ' ')}</th>
                    ))}
                    <th className="p-3.5 text-right">Inspect</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-border/40">
                  {filteredRecords.map((r) => (
                    <tr key={r.id} className="hover:bg-white/5 transition-colors">
                      <td className="p-3.5 font-mono text-muted-foreground">{r.id}</td>
                      <td className="p-3.5 text-muted-foreground font-medium max-w-[150px] truncate" title={getSourceTitle(r.source_id)}>
                        {getSourceTitle(r.source_id)}
                      </td>
                      {columns.map(col => {
                        const val = r.data_json[col]
                        return (
                          <td key={col} className="p-3.5 font-semibold text-white truncate max-w-[200px]" title={String(val)}>
                            {val === null || val === undefined ? (
                              <span className="text-muted-foreground/40 italic">null</span>
                            ) : typeof val === 'boolean' ? (
                              val ? 'true' : 'false'
                            ) : (
                              String(val)
                            )}
                          </td>
                        )
                      })}
                      <td className="p-3.5 text-right">
                        <button
                          onClick={() => setInspectingRecord(r)}
                          className="p-1 rounded bg-primary/10 border border-primary/20 text-primary hover:bg-primary hover:text-white transition-colors"
                        >
                          <Eye size={12} />
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ) : viewMode === 'card' ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {filteredRecords.map((r) => (
                <div key={r.id} className="p-5 bg-black/30 border border-border/60 hover:border-primary/40 rounded-xl transition-all flex flex-col justify-between">
                  <div className="space-y-3">
                    <div className="flex justify-between items-center pb-2 border-b border-border/40">
                      <span className="text-[10px] font-mono text-muted-foreground">ID: #{r.id}</span>
                      <button
                        onClick={() => setInspectingRecord(r)}
                        className="text-xs text-primary hover:text-primary-foreground hover:bg-primary px-2 py-0.5 rounded border border-primary/20 flex items-center gap-1 transition-all"
                      >
                        Inspect <Eye size={10} />
                      </button>
                    </div>
                    <div className="space-y-2">
                      {columns.map(col => (
                        <div key={col} className="flex justify-between items-start text-xs leading-tight">
                          <span className="text-muted-foreground font-mono shrink-0 mr-4">{col}:</span>
                          <span className="font-semibold text-white text-right break-all">
                            {r.data_json[col] === null ? 'null' : String(r.data_json[col])}
                          </span>
                        </div>
                      ))}
                    </div>
                  </div>
                  <div className="mt-4 pt-3 border-t border-border/30 text-[9px] text-muted-foreground/70 font-mono truncate">
                    From: {getSourceTitle(r.source_id)}
                  </div>
                </div>
              ))}
            </div>
          ) : (
            // RAW JSON View
            <div className="rounded-xl border border-border/60 p-4 bg-black/40 font-mono text-xs text-muted-foreground overflow-x-auto leading-relaxed max-h-[500px]">
              <pre>{JSON.stringify(filteredRecords.map(r => ({
                id: r.id,
                source_id: r.source_id,
                record_type: r.record_type,
                data: r.data_json,
                created_at: r.created_at
              })), null, 2)}</pre>
            </div>
          )}
        </div>
      </section>

      {/* Record Inspector Modal */}
      {inspectingRecord && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/75 backdrop-blur-sm animate-fade-in">
          <div className="w-full max-w-2xl glass-card rounded-2xl border border-border overflow-hidden shadow-2xl flex flex-col max-h-[85vh]">
            <div className="p-5 border-b border-border flex justify-between items-center bg-black/20">
              <div>
                <h4 className="font-display font-bold text-lg text-white">Record Inspector</h4>
                <p className="text-xs text-muted-foreground font-mono">Record Type: {inspectingRecord.record_type} | ID: #{inspectingRecord.id}</p>
              </div>
              <button
                onClick={() => setInspectingRecord(null)}
                className="text-muted-foreground hover:text-white bg-white/5 hover:bg-white/10 px-3 py-1.5 rounded-lg text-xs font-semibold border border-border"
              >
                Close Inspector
              </button>
            </div>

            <div className="p-6 overflow-y-auto space-y-6 flex-1">
              {/* Properties Grid */}
              <div>
                <h5 className="text-xs font-bold uppercase tracking-wider text-primary mb-3">Extracted Fields</h5>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  {Object.entries(inspectingRecord.data_json).map(([key, val]) => (
                    <div key={key} className="bg-black/30 p-3.5 rounded-xl border border-border/60">
                      <p className="text-[10px] font-mono text-muted-foreground uppercase tracking-wider mb-1">{key.replace(/_/g, ' ')}</p>
                      <p className="text-sm font-semibold text-white font-mono break-words">
                        {val === null || val === undefined ? (
                          <span className="text-muted-foreground/30 italic">null</span>
                        ) : typeof val === 'boolean' ? (
                          val ? 'true' : 'false'
                        ) : (
                          String(val)
                        )}
                      </p>
                    </div>
                  ))}
                </div>
              </div>

              {/* Source Details */}
              <div className="bg-black/30 p-4 rounded-xl border border-border/60">
                <h5 className="text-xs font-bold uppercase tracking-wider text-violet-400 mb-2.5">Origin Source Information</h5>
                <div className="space-y-1.5 text-xs">
                  <div className="flex justify-between">
                    <span className="text-muted-foreground font-mono">Source ID:</span>
                    <span className="text-white font-mono">#{inspectingRecord.source_id}</span>
                  </div>
                  <div className="flex justify-between items-start">
                    <span className="text-muted-foreground font-mono mr-4 shrink-0">Source Title:</span>
                    <span className="text-white font-semibold text-right max-w-sm truncate" title={getSourceTitle(inspectingRecord.source_id)}>
                      {getSourceTitle(inspectingRecord.source_id)}
                    </span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground font-mono">Ingested Date:</span>
                    <span className="text-white font-mono">{new Date(inspectingRecord.created_at).toLocaleString()}</span>
                  </div>
                </div>
              </div>

              {/* Full JSON Dump */}
              <div>
                <h5 className="text-xs font-bold uppercase tracking-wider text-fuchsia-400 mb-2">Raw JSON Data</h5>
                <div className="bg-black/50 border border-border p-4 rounded-xl font-mono text-xs text-muted-foreground overflow-x-auto leading-relaxed">
                  <pre>{JSON.stringify(inspectingRecord.data_json, null, 2)}</pre>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
