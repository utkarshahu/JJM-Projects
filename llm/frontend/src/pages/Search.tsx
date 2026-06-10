import React, { useState, useEffect } from 'react'
import { useStore } from '../store/useStore'
import { 
  Search as SearchIcon, 
  Terminal, 
  Play, 
  AlertCircle, 
  Clock, 
  Copy, 
  Check, 
  History,
  CornerDownRight,
  Database
} from 'lucide-react'

export const Search: React.FC = () => {
  const { 
    queryResult, 
    queryLoading, 
    queryError, 
    queryHistory,
    runQuery, 
    fetchQueryHistory,
    clearQueryError
  } = useStore()

  const [inputQuery, setInputQuery] = useState('')
  const [copied, setCopied] = useState(false)

  // Example queries for users to click
  const sampleQueries = [
    "Show districts having more than 20 drains",
    "Show top companies by revenue",
    "Show products above ₹5000",
    "Show list of all rivers and their drains count",
    "Find companies with more than 100000 employees"
  ]

  useEffect(() => {
    fetchQueryHistory()
  }, [])

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (!inputQuery.trim()) return
    runQuery(inputQuery)
  }

  const handleSampleClick = (q: string) => {
    setInputQuery(q)
    runQuery(q)
  }

  const handleCopySql = () => {
    if (!queryResult?.sql) return
    navigator.clipboard.writeText(queryResult.sql)
    setCopied(true)
    setTimeout(() => setCopied(false), 2000)
  }

  return (
    <div className="flex-1 flex flex-col lg:flex-row gap-6 min-h-0 overflow-hidden pr-2">
      {/* Left Pane: Search Console & Results */}
      <div className="flex-1 flex flex-col min-h-0 min-w-0 space-y-6">
        {/* Title */}
        <div>
          <h2 className="font-display font-bold text-3xl text-white">Natural Language Search</h2>
          <p className="text-muted-foreground text-sm">Ask questions about your data in English. The AI engine will translate, validate, and query MySQL JSON columns dynamically.</p>
        </div>

        {/* Console Box */}
        <div className="glass-card p-6 rounded-2xl border border-border">
          <form onSubmit={handleSubmit} className="space-y-4">
            <div className="relative">
              <span className="absolute inset-y-0 left-0 pl-4 flex items-center text-muted-foreground pointer-events-none">
                <SearchIcon size={18} />
              </span>
              <input
                type="text"
                value={inputQuery}
                onChange={(e) => setInputQuery(e.target.value)}
                placeholder="Ask your database: 'Show top 5 companies by revenue'"
                className="w-full pl-11 pr-24 py-3.5 rounded-xl bg-black/40 border border-border text-sm text-foreground focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition-all placeholder:text-muted-foreground/60"
              />
              <button
                type="submit"
                disabled={queryLoading || !inputQuery.trim()}
                className="absolute right-2 top-2 flex items-center gap-1.5 bg-primary hover:bg-primary/95 text-primary-foreground text-xs font-semibold px-4 py-2 rounded-lg transition-all disabled:opacity-50"
              >
                {queryLoading ? (
                  <>
                    <Clock size={12} className="animate-spin" /> Translating...
                  </>
                ) : (
                  <>
                    <Play size={12} /> Run Query
                  </>
                )}
              </button>
            </div>

            {/* Sample Queries Chips */}
            <div className="flex flex-wrap gap-2 items-center">
              <span className="text-[10px] text-muted-foreground uppercase font-semibold tracking-wider">Try asking:</span>
              {sampleQueries.map((q, i) => (
                <button
                  key={i}
                  type="button"
                  onClick={() => handleSampleClick(q)}
                  className="bg-white/5 hover:bg-white/10 text-muted-foreground hover:text-white border border-border px-2.5 py-1 rounded-lg text-xs transition-all"
                >
                  {q}
                </button>
              ))}
            </div>
          </form>
        </div>

        {/* Error Message */}
        {queryError && (
          <div className="p-4 bg-rose-500/10 border border-rose-500/20 rounded-xl flex items-start gap-3 text-sm text-rose-400">
            <AlertCircle size={18} className="shrink-0 mt-0.5" />
            <div>
              <p className="font-semibold">Query Execution Failed</p>
              <p className="text-xs text-muted-foreground mt-0.5">{queryError}</p>
            </div>
          </div>
        )}

        {/* Query Translation Breakdown & Tabular Results */}
        {queryResult && (
          <div className="flex-1 flex flex-col min-h-0 space-y-4">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 shrink-0">
              {/* Reasoning */}
              <div className="bg-black/30 border border-border/60 p-4 rounded-xl flex flex-col justify-between">
                <div>
                  <h4 className="text-xs font-bold uppercase tracking-wider text-primary mb-2">Translation Reasoning</h4>
                  <p className="text-xs text-muted-foreground leading-relaxed italic">
                    "{queryResult.thought}"
                  </p>
                </div>
                <div className="mt-4 flex items-center gap-1.5 text-[10px] text-muted-foreground font-mono">
                  <Clock size={12} />
                  <span>Casted columns and executed in {queryResult.execution_time_seconds.toFixed(3)}s</span>
                </div>
              </div>

              {/* Generated SQL block */}
              <div className="bg-slate-950/80 border border-border/80 p-4 rounded-xl relative flex flex-col">
                <div className="flex justify-between items-center pb-2 border-b border-border/40 mb-2.5">
                  <span className="text-[10px] font-mono text-violet-400 flex items-center gap-1.5">
                    <Terminal size={12} /> generated_query.sql
                  </span>
                  <button
                    onClick={handleCopySql}
                    className="p-1 rounded bg-white/5 hover:bg-white/10 border border-border text-muted-foreground hover:text-white transition-all"
                    title="Copy to clipboard"
                  >
                    {copied ? <Check size={12} className="text-emerald-400" /> : <Copy size={12} />}
                  </button>
                </div>
                <div className="flex-1 font-mono text-[11px] text-emerald-400 overflow-x-auto whitespace-pre leading-relaxed select-all">
                  <code>{queryResult.sql}</code>
                </div>
              </div>
            </div>

            {/* Results Grid */}
            <div className="flex-1 glass-card p-5 rounded-2xl border border-border flex flex-col min-h-0">
              <div className="flex items-center justify-between pb-3 border-b border-border mb-4">
                <span className="text-xs font-bold uppercase tracking-wider text-white flex items-center gap-2">
                  <Database size={14} className="text-primary" /> SQL Output Records
                </span>
                <span className="text-[10px] text-muted-foreground font-mono bg-slate-900 border border-border px-2 py-0.5 rounded">
                  {queryResult.results.length} rows returned
                </span>
              </div>

              {queryResult.results.length === 0 ? (
                <div className="flex-1 flex items-center justify-center text-center py-12 text-muted-foreground text-sm">
                  SQL executed successfully but returned 0 rows. Verify target database filters.
                </div>
              ) : (
                <div className="flex-1 overflow-auto rounded-xl border border-border/50">
                  <table className="w-full text-left text-xs border-collapse">
                    <thead>
                      <tr className="bg-black/50 text-muted-foreground font-semibold border-b border-border uppercase tracking-wider text-[10px]">
                        {queryResult.columns.map((col: string) => (
                          <th key={col} className="p-3.5">{col.replace(/_/g, ' ')}</th>
                        ))}
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-border/40">
                      {queryResult.results.map((row: any, rIdx: number) => (
                        <tr key={rIdx} className="hover:bg-white/5 transition-colors">
                          {queryResult.columns.map((col: string) => {
                            const val = row[col]
                            return (
                              <td key={col} className="p-3.5 font-mono text-white max-w-[250px] truncate" title={String(val)}>
                                {val === null || val === undefined ? (
                                  <span className="text-muted-foreground/30 italic">null</span>
                                ) : typeof val === 'boolean' ? (
                                  val ? 'true' : 'false'
                                ) : (
                                  String(val)
                                )}
                              </td>
                            )
                          })}
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          </div>
        )}
      </div>

      {/* Right Pane: Query History Log */}
      <aside className="w-full lg:w-72 glass-card p-5 rounded-2xl border border-border shrink-0 flex flex-col min-h-0">
        <div className="flex items-center gap-2 mb-4 text-violet-400">
          <History size={16} />
          <h3 className="font-display font-bold text-sm uppercase tracking-wider text-white">Search History</h3>
        </div>

        {queryHistory.length === 0 ? (
          <div className="flex-1 flex items-center justify-center text-center p-4">
            <span className="text-xs text-muted-foreground">No query logs recorded yet.</span>
          </div>
        ) : (
          <div className="flex-1 overflow-y-auto space-y-3 pr-1">
            {queryHistory.map((item) => (
              <div 
                key={item.id} 
                className="p-3 bg-black/30 border border-border/50 hover:border-primary/40 rounded-xl transition-all cursor-pointer group"
                onClick={() => handleSampleClick(item.user_query)}
              >
                <div className="flex items-start gap-1.5">
                  <CornerDownRight size={12} className="text-primary mt-0.5 shrink-0 group-hover:translate-x-0.5 transition-transform" />
                  <p className="text-xs font-semibold text-white leading-tight group-hover:text-primary transition-colors">
                    {item.user_query}
                  </p>
                </div>
                <div className="mt-2.5 flex items-center justify-between text-[9px] text-muted-foreground font-mono">
                  <span>Latency: {item.execution_time.toFixed(2)}s</span>
                  <span>{new Date(item.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</span>
                </div>
              </div>
            ))}
          </div>
        )}
      </aside>
    </div>
  )
}
