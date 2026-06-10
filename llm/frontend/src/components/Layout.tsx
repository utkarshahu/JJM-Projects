import React, { useEffect } from 'react'
import { 
  LayoutDashboard, 
  Database, 
  Search, 
  Table, 
  BarChart3, 
  Settings, 
  Brain,
  AlertCircle,
  CheckCircle,
  Menu,
  X
} from 'lucide-react'
import { useStore } from '../store/useStore'

interface LayoutProps {
  children: React.ReactNode
}

export const Layout: React.FC<LayoutProps> = ({ children }) => {
  const { settings, fetchSettings, activeTab, setActiveTab } = useStore()
  const [mobileOpen, setMobileOpen] = React.useState(false)

  useEffect(() => {
    fetchSettings()
  }, [])

  const menuItems = [
    { id: 'dashboard', label: 'Dashboard', icon: LayoutDashboard },
    { id: 'sources', label: 'Sources Ingestion', icon: Database },
    { id: 'explorer', label: 'Data Explorer', icon: Table },
    { id: 'search', label: 'Natural Language Search', icon: Search },
    { id: 'analytics', label: 'Analytics Panel', icon: BarChart3 },
    { id: 'settings', label: 'Settings', icon: Settings },
  ]

  return (
    <div className="flex min-h-screen bg-background text-foreground font-sans">
      {/* Background glow effects */}
      <div className="absolute top-0 left-0 w-full h-full overflow-hidden pointer-events-none z-0">
        <div className="absolute top-1/4 left-1/4 w-[40rem] h-[40rem] glow-blue rounded-full filter blur-[120px] opacity-30"></div>
        <div className="absolute top-1/2 right-1/4 w-[40rem] h-[40rem] glow-purple rounded-full filter blur-[120px] opacity-20"></div>
      </div>

      {/* Sidebar - Desktop */}
      <aside className="hidden md:flex flex-col w-64 glass-card border-r border-border shrink-0 z-10 m-4 rounded-2xl">
        <div className="p-6 flex items-center gap-3 border-b border-border">
          <div className="p-2 bg-primary/20 rounded-xl text-primary text-glow animate-pulse-glow">
            <Brain size={24} />
          </div>
          <div>
            <h1 className="font-display font-bold text-lg leading-tight tracking-tight">UDIP</h1>
            <p className="text-[10px] text-muted-foreground uppercase tracking-widest font-semibold">Data Intelligence</p>
          </div>
        </div>

        <nav className="flex-1 px-4 py-6 space-y-1.5 overflow-y-auto">
          {menuItems.map((item) => {
            const Icon = item.icon
            const active = activeTab === item.id
            return (
              <button
                key={item.id}
                onClick={() => setActiveTab(item.id)}
                className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-all ${
                  active 
                    ? 'bg-primary text-primary-foreground shadow-lg shadow-primary/20' 
                    : 'text-muted-foreground hover:bg-white/5 hover:text-foreground'
                }`}
              >
                <Icon size={18} className={active ? 'scale-110 transition-transform' : ''} />
                {item.label}
              </button>
            )
          })}
        </nav>

        {/* System Health */}
        <div className="p-4 border-t border-border bg-black/20 rounded-b-2xl">
          <div className="flex items-center justify-between text-xs text-muted-foreground">
            <span>Gemini Key Status</span>
            {settings?.has_gemini_api_key ? (
              <span className="flex items-center gap-1 text-emerald-400 font-semibold">
                <CheckCircle size={12} /> Ready
              </span>
            ) : (
              <span className="flex items-center gap-1 text-rose-400 font-semibold animate-pulse">
                <AlertCircle size={12} /> Config Required
              </span>
            )}
          </div>
        </div>
      </aside>

      {/* Mobile Header and Sidebar overlay */}
      {mobileOpen && (
        <div className="fixed inset-0 bg-black/60 z-40 md:hidden backdrop-blur-sm" onClick={() => setMobileOpen(false)} />
      )}
      
      <aside className={`fixed top-0 left-0 bottom-0 w-64 bg-slate-950/95 border-r border-border z-50 transition-transform duration-300 md:hidden ${
        mobileOpen ? 'translate-x-0' : '-translate-x-full'
      }`}>
        <div className="p-6 flex items-center justify-between border-b border-border">
          <div className="flex items-center gap-3">
            <Brain size={24} className="text-primary" />
            <h1 className="font-display font-bold text-lg">UDIP</h1>
          </div>
          <button onClick={() => setMobileOpen(false)} className="text-muted-foreground hover:text-foreground">
            <X size={20} />
          </button>
        </div>
        <nav className="p-4 space-y-1.5">
          {menuItems.map((item) => {
            const Icon = item.icon
            const active = activeTab === item.id
            return (
              <button
                key={item.id}
                onClick={() => {
                  setActiveTab(item.id)
                  setMobileOpen(false)
                }}
                className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-all ${
                  active 
                    ? 'bg-primary text-primary-foreground shadow-lg' 
                    : 'text-muted-foreground hover:bg-white/5 hover:text-foreground'
                }`}
              >
                <Icon size={18} />
                {item.label}
              </button>
            )
          })}
        </nav>
      </aside>

      {/* Content wrapper */}
      <div className="flex-1 flex flex-col min-w-0 z-10 p-4 md:p-6 md:pl-2">
        {/* Mobile top bar */}
        <header className="flex md:hidden items-center justify-between p-4 mb-4 glass-card rounded-2xl border border-border">
          <div className="flex items-center gap-3">
            <button onClick={() => setMobileOpen(true)} className="text-muted-foreground hover:text-foreground">
              <Menu size={24} />
            </button>
            <h1 className="font-display font-bold text-lg">UDIP</h1>
          </div>
          <div className="flex items-center gap-1.5 text-xs">
            {settings?.has_gemini_api_key ? (
              <span className="w-2.5 h-2.5 rounded-full bg-emerald-500 shadow-md shadow-emerald-500/50" />
            ) : (
              <span className="w-2.5 h-2.5 rounded-full bg-rose-500 animate-pulse shadow-md shadow-rose-500/50" />
            )}
            <span className="text-muted-foreground">AI Platform</span>
          </div>
        </header>

        {/* Main Content Pane */}
        <main className="flex-1 flex flex-col min-h-0 bg-transparent">
          {children}
        </main>
      </div>
    </div>
  )
}
