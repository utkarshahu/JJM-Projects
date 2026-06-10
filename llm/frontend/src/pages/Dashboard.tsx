import React, { useEffect, useState } from 'react'
import { useStore } from '../store/useStore'
import { 
  Database, 
  FileSpreadsheet, 
  Binary, 
  Sparkles, 
  Plus, 
  Link as LinkIcon, 
  CheckCircle2, 
  XCircle, 
  Loader2 
} from 'lucide-react'

export const Dashboard: React.FC = () => {
  const { 
    sources, 
    schemas, 
    records, 
    fetchSources, 
    fetchSchemas, 
    fetchRecords,
    submitUrl,
    submittingSource,
    setActiveTab
  } = useStore()

  const [quickUrl, setQuickUrl] = useState('')
  const [urlError, setUrlError] = useState('')

  useEffect(() => {
    fetchSources()
    fetchSchemas()
    fetchRecords()
  }, [])

  const handleQuickSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setUrlError('')
    if (!quickUrl.trim()) return

    try {
      // Validate simple URL regex
      new URL(quickUrl)
      await submitUrl(quickUrl, false)
      setQuickUrl('')
      // Show success
    } catch (err) {
      setUrlError('Please enter a valid URL (include http:// or https://)')
    }
  }

  // Calculate metrics
  const totalSources = sources.length
  const totalSchemas = new Set(schemas.map(s => s.schema_name)).size
  const totalRecords = records.length
  const activeJobs = sources.filter(s => s.status === 'pending' || s.status === 'processing').length

  const stats = [
    { label: 'Data Sources Ingested', value: totalSources, icon: Database, color: 'text-indigo-400 bg-indigo-500/10', tab: 'sources' },
    { label: 'Discovered Schemas', value: totalSchemas, icon: Binary, color: 'text-violet-400 bg-violet-500/10', tab: 'explorer' },
    { label: 'Extracted Records', value: totalRecords, icon: FileSpreadsheet, color: 'text-fuchsia-400 bg-fuchsia-500/10', tab: 'explorer' },
    { label: 'Active Ingestions', value: activeJobs, icon: Loader2, color: `text-blue-400 bg-blue-500/10 ${activeJobs > 0 ? 'animate-spin' : ''}`, tab: 'sources' },
  ]

  // Get recent sources (max 5)
  const recentSources = sources.slice(0, 5)

  return (
    <div className="flex-1 space-y-6 overflow-y-auto pr-2">
      {/* Welcome header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h2 className="font-display font-bold text-3xl tracking-tight text-white">System Control Panel</h2>
          <p className="text-muted-foreground text-sm">Universal real-time AI document and web ingestion pipeline.</p>
        </div>
        <div className="flex items-center gap-2 text-xs bg-slate-900 border border-border px-3 py-1.5 rounded-lg text-muted-foreground font-mono">
          <span>Server Status:</span>
          <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
          <span className="text-emerald-400 font-semibold">Online</span>
        </div>
      </div>

      {/* Metrics Row */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {stats.map((stat, i) => {
          const Icon = stat.icon
          return (
            <div 
              key={i} 
              onClick={() => setActiveTab(stat.tab)}
              className="glass-card p-6 rounded-2xl border border-border flex items-center justify-between cursor-pointer hover:border-primary/50 hover:shadow-lg hover:shadow-primary/5 hover:translate-y-[-2px] active:scale-[0.98] transition-all duration-300"
            >
              <div>
                <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-1">{stat.label}</p>
                <h3 className="font-display font-extrabold text-3xl text-white">{stat.value}</h3>
              </div>
              <div className={`p-4 rounded-xl ${stat.color}`}>
                <Icon size={24} />
              </div>
            </div>
          )
        })}
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Quick URL ingestion card */}
        <div className="lg:col-span-1 glass-card p-6 rounded-2xl border border-border flex flex-col justify-between">
          <div>
            <div className="flex items-center gap-2 mb-2 text-primary">
              <Sparkles size={18} className="animate-bounce" />
              <h4 className="font-display font-bold text-lg text-white">Quick URL Extract</h4>
            </div>
            <p className="text-xs text-muted-foreground mb-4">
              Enter any URL to fetch raw web text, tables, and render JS-heavy content. The AI engine automatically detects properties and saves structured data.
            </p>
            <form onSubmit={handleQuickSubmit} className="space-y-3">
              <div>
                <div className="relative">
                  <span className="absolute inset-y-0 left-0 pl-3.5 flex items-center text-muted-foreground">
                    <LinkIcon size={14} />
                  </span>
                  <input
                    type="text"
                    value={quickUrl}
                    onChange={(e) => setQuickUrl(e.target.value)}
                    placeholder="https://example.com/data"
                    className="w-full pl-9 pr-4 py-2.5 rounded-xl bg-black/40 border border-border text-sm text-foreground focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition-all placeholder:text-muted-foreground/60"
                  />
                </div>
                {urlError && <span className="text-xs text-rose-400 mt-1 block">{urlError}</span>}
              </div>
              <button
                type="submit"
                disabled={submittingSource}
                className="w-full flex items-center justify-center gap-2 py-2.5 rounded-xl bg-primary text-primary-foreground text-sm font-semibold transition-all hover:bg-primary/95 hover:shadow-lg hover:shadow-primary/10 disabled:opacity-50"
              >
                {submittingSource ? (
                  <>
                    <Loader2 size={16} className="animate-spin" /> Ingesting...
                  </>
                ) : (
                  <>
                    <Plus size={16} /> Submit URL
                  </>
                )}
              </button>
            </form>
          </div>
          <div className="mt-4 pt-4 border-t border-border/40 text-[11px] text-muted-foreground/80 flex items-center gap-1.5">
            <span className="w-1.5 h-1.5 bg-indigo-500 rounded-full"></span>
            <span>Supports Government, News, and E-commerce sites</span>
          </div>
        </div>

        {/* Recent Ingestions log */}
        <div className="lg:col-span-2 glass-card p-6 rounded-2xl border border-border">
          <div className="flex items-center justify-between mb-4">
            <h4 className="font-display font-bold text-lg text-white">Recent Ingestion Activity</h4>
            <span className="text-xs text-muted-foreground font-mono">Last 5 submissions</span>
          </div>

          <div className="space-y-3.5">
            {recentSources.length === 0 ? (
              <div className="text-center py-12 border border-dashed border-border/50 rounded-xl text-muted-foreground text-sm">
                No ingestion sources recorded. Upload files or submit URLs to get started.
              </div>
            ) : (
              recentSources.map((source) => {
                const isUrl = source.source_type === 'url'
                const statusColors = {
                  completed: 'bg-emerald-500/10 text-emerald-400 border-emerald-500/20',
                  failed: 'bg-rose-500/10 text-rose-400 border-rose-500/20',
                  processing: 'bg-blue-500/10 text-blue-400 border-blue-500/20',
                  pending: 'bg-yellow-500/10 text-yellow-400 border-yellow-500/20'
                }[source.status] || 'bg-slate-500/10 text-slate-400 border-slate-500/20'
                
                const handleCardClick = () => {
                  if (isUrl && source.url) {
                    window.open(source.url, '_blank', 'noopener,noreferrer')
                  } else {
                    setActiveTab('explorer')
                  }
                }

                return (
                  <div 
                    key={source.id} 
                    onClick={handleCardClick}
                    className="flex items-center justify-between p-3.5 bg-black/20 hover:bg-black/30 rounded-xl border border-border/40 transition-all cursor-pointer hover:border-primary/40 group active:scale-[0.99]"
                  >
                    <div className="flex items-center gap-3.5 min-w-0">
                      <div className="p-2.5 bg-slate-900 rounded-lg text-muted-foreground text-xs uppercase font-mono tracking-wider font-semibold border border-border group-hover:border-primary/20">
                        {source.source_type}
                      </div>
                      <div className="min-w-0">
                        <p className="text-sm font-semibold text-white truncate max-w-md group-hover:text-primary transition-colors">
                          {source.title || source.url}
                        </p>
                        <p className="text-[10px] text-muted-foreground mt-0.5 font-mono truncate group-hover:text-muted-foreground/90">
                          {isUrl ? source.url : `Local File ID: ${source.id}`}
                        </p>
                      </div>
                    </div>
                    
                    <div className="flex items-center gap-3 shrink-0">
                      <span className={`text-[11px] font-semibold uppercase tracking-wider px-2.5 py-1 rounded-full border ${statusColors}`}>
                        {source.status}
                      </span>
                      <span className="text-[10px] text-muted-foreground font-mono hidden sm:inline">
                        {new Date(source.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                      </span>
                    </div>
                  </div>
                )
              })
            )}
          </div>
        </div>
      </div>

      {/* Discovered Schemas Grid */}
      <div className="glass-card p-6 rounded-2xl border border-border">
        <h4 className="font-display font-bold text-lg text-white mb-4">Discovered Data Schemas</h4>
        {schemas.length === 0 ? (
          <div className="text-center py-12 border border-dashed border-border/50 rounded-xl text-muted-foreground text-sm">
            No dynamic schemas registered. Schema definitions are generated automatically during extraction.
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {Array.from(new Set(schemas.map(s => s.schema_name))).map((sName) => {
              const matchingSchemas = schemas.filter(s => s.schema_name === sName)
              const firstSchema = matchingSchemas[0]
              const fields = Object.entries(firstSchema.schema_json)
              
              return (
                <div key={sName} className="p-4 bg-black/30 rounded-xl border border-border/60 flex flex-col justify-between">
                  <div>
                    <h5 className="font-display font-bold text-base text-primary leading-tight mb-2 tracking-wide">
                      {sName}
                    </h5>
                    <div className="space-y-1">
                      {fields.map(([fName, fType]) => (
                        <div key={fName} className="flex justify-between items-center text-xs">
                          <span className="text-muted-foreground font-mono">{fName}</span>
                          <span className="bg-white/5 text-muted-foreground px-1.5 py-0.5 rounded text-[10px] font-semibold">{fType}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                  <div className="mt-4 pt-3 border-t border-border/40 flex justify-between text-[10px] text-muted-foreground/80 font-mono">
                    <span>Active Records: {records.filter(r => r.record_type === sName).length}</span>
                    <span>Sources: {matchingSchemas.length}</span>
                  </div>
                </div>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}
