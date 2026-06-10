import React, { useEffect, useState } from 'react'
import { useStore } from '../store/useStore'
import { 
  Settings as SettingsIcon, 
  Key, 
  Layers, 
  Database, 
  CheckCircle2, 
  AlertCircle,
  HelpCircle,
  Save,
  Loader2
} from 'lucide-react'

export const Settings: React.FC = () => {
  const { 
    settings, 
    loadingSettings, 
    fetchSettings, 
    updateSettings 
  } = useStore()

  const [apiKey, setApiKey] = useState('')
  const [maxDepth, setMaxDepth] = useState(2)
  const [maxPages, setMaxPages] = useState(10)
  
  const [saving, setSaving] = useState(false)
  const [saveSuccess, setSaveSuccess] = useState(false)
  const [saveError, setSaveError] = useState('')

  useEffect(() => {
    fetchSettings()
  }, [])

  // Populate local form fields when backend settings load
  useEffect(() => {
    if (settings) {
      setMaxDepth(settings.max_depth)
      setMaxPages(settings.max_pages)
    }
  }, [settings])

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault()
    setSaving(true)
    setSaveSuccess(false)
    setSaveError('')

    try {
      await updateSettings(apiKey, maxDepth, maxPages)
      setSaveSuccess(true)
      setApiKey('') // Clear raw input after saving
      setTimeout(() => setSaveSuccess(false), 3000)
    } catch (err: any) {
      setSaveError(err.message || 'Failed to update settings.')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="flex-1 space-y-6 overflow-y-auto pr-2">
      {/* Title */}
      <div>
        <h2 className="font-display font-bold text-3xl text-white">System Settings</h2>
        <p className="text-muted-foreground text-sm">Configure environment credentials, crawling bounds, and monitor database infrastructure.</p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Settings Form panel */}
        <div className="lg:col-span-2 glass-card p-6 rounded-2xl border border-border">
          <div className="flex items-center gap-2 mb-6 text-primary">
            <SettingsIcon size={20} />
            <h3 className="font-display font-bold text-lg text-white">Platform Configuration</h3>
          </div>

          {loadingSettings ? (
            <div className="flex items-center justify-center py-12">
              <Loader2 className="animate-spin text-primary" size={24} />
              <span className="text-xs text-muted-foreground ml-2">Loading stored settings...</span>
            </div>
          ) : (
            <form onSubmit={handleSave} className="space-y-6">
              {/* Gemini API Key input */}
              <div className="space-y-2">
                <label className="text-xs font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                  <Key size={14} /> Gemini API Key
                </label>
                <input
                  type="password"
                  value={apiKey}
                  onChange={(e) => setApiKey(e.target.value)}
                  placeholder={settings?.has_gemini_api_key ? "•••••••••••••••••••••••• (Using Active Key)" : "AIzaSy..."}
                  className="w-full px-4 py-2.5 rounded-xl bg-black/40 border border-border text-sm text-foreground focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition-all placeholder:text-muted-foreground/40"
                />
                <p className="text-[10px] text-muted-foreground leading-relaxed flex items-center gap-1">
                  <HelpCircle size={10} className="shrink-0" />
                  <span>Your key is stored locally in the docker volume settings configuration. Never exposed publicly.</span>
                </p>
              </div>

              {/* Crawl boundary configurations */}
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 pt-2">
                <div className="space-y-2">
                  <label className="text-xs font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                    <Layers size={14} /> Default Crawl Depth
                  </label>
                  <input
                    type="number"
                    min={1}
                    max={4}
                    value={maxDepth}
                    onChange={(e) => setMaxDepth(Number(e.target.value))}
                    className="w-full px-4 py-2 rounded-xl bg-black/40 border border-border text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                  />
                  <p className="text-[10px] text-muted-foreground">Sets how many link layers the crawler visits recursively.</p>
                </div>

                <div className="space-y-2">
                  <label className="text-xs font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                    <Layers size={14} /> Max Crawled Pages
                  </label>
                  <input
                    type="number"
                    min={1}
                    max={50}
                    value={maxPages}
                    onChange={(e) => setMaxPages(Number(e.target.value))}
                    className="w-full px-4 py-2 rounded-xl bg-black/40 border border-border text-sm text-white focus:outline-none focus:ring-2 focus:ring-primary"
                  />
                  <p className="text-[10px] text-muted-foreground">Sets maximum pages processed per crawling job to limit API token usage.</p>
                </div>
              </div>

              {/* Status and button */}
              <div className="pt-4 border-t border-border/40 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                  {saveSuccess && <span className="text-xs text-emerald-400 font-semibold flex items-center gap-1"><CheckCircle2 size={12} /> Credentials saved successfully!</span>}
                  {saveError && <span className="text-xs text-rose-400 font-semibold flex items-center gap-1"><AlertCircle size={12} /> {saveError}</span>}
                </div>
                
                <button
                  type="submit"
                  disabled={saving}
                  className="flex items-center justify-center gap-2 bg-primary hover:bg-primary/95 text-primary-foreground font-semibold text-sm px-6 py-2.5 rounded-xl transition-all disabled:opacity-50 shrink-0"
                >
                  {saving ? (
                    <>
                      <Loader2 size={16} className="animate-spin" /> Saving...
                    </>
                  ) : (
                    <>
                      <Save size={16} /> Save Configurations
                    </>
                  )}
                </button>
              </div>
            </form>
          )}
        </div>

        {/* Infrastructure Audit panel */}
        <div className="lg:col-span-1 glass-card p-6 rounded-2xl border border-border flex flex-col justify-between">
          <div>
            <div className="flex items-center gap-2 mb-6 text-violet-400">
              <Database size={20} />
              <h3 className="font-display font-bold text-lg text-white">System Environment</h3>
            </div>

            <div className="space-y-4">
              {/* Database status */}
              <div className="p-4 bg-black/30 rounded-xl border border-border/60">
                <div className="flex justify-between items-center mb-1.5">
                  <span className="text-xs font-semibold text-white">MySQL Database</span>
                  <span className="flex items-center gap-1 text-[10px] bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 px-2 py-0.5 rounded-full font-bold">
                    Connected
                  </span>
                </div>
                <div className="text-[10px] font-mono text-muted-foreground space-y-0.5">
                  <p>Database: {settings?.mysql_database || "data_intelligence_db"}</p>
                  <p>Driver: pymysql (MySQL 8.0)</p>
                </div>
              </div>

              {/* Cache status */}
              <div className="p-4 bg-black/30 rounded-xl border border-border/60">
                <div className="flex justify-between items-center mb-1.5">
                  <span className="text-xs font-semibold text-white">Redis Broker & Cache</span>
                  <span className="flex items-center gap-1 text-[10px] bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 px-2 py-0.5 rounded-full font-bold">
                    Connected
                  </span>
                </div>
                <div className="text-[10px] font-mono text-muted-foreground space-y-0.5">
                  <p>Endpoint: redis://redis:6379/0</p>
                  <p>Used for: Celery Jobs & Ingestion Cache</p>
                </div>
              </div>

              {/* Storage directories */}
              <div className="p-4 bg-black/30 rounded-xl border border-border/60 text-xs">
                <span className="font-semibold text-white block mb-1">Persistent Volume Mounts</span>
                <p className="font-mono text-[10px] text-muted-foreground break-all">
                  Upload Directory: {settings?.upload_directory || "/app/uploads"}
                </p>
              </div>
            </div>
          </div>

          <div className="mt-6 pt-4 border-t border-border/40 text-[10px] text-center text-muted-foreground/60">
            UDIP Enterprise Engine v1.0.0
          </div>
        </div>
      </div>
    </div>
  )
}
