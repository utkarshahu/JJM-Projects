import React from 'react'
import { Layout } from './components/Layout'
import { Dashboard } from './pages/Dashboard'
import { Sources } from './pages/Sources'
import { Explorer } from './pages/Explorer'
import { Search } from './pages/Search'
import { Analytics } from './pages/Analytics'
import { Settings } from './pages/Settings'
import { useStore } from './store/useStore'

export const App: React.FC = () => {
  const { activeTab } = useStore()

  // Render view depending on the activeTab state
  const renderContent = () => {
    switch (activeTab) {
      case 'dashboard':
        return <Dashboard />
      case 'sources':
        return <Sources />
      case 'explorer':
        return <Explorer />
      case 'search':
        return <Search />
      case 'analytics':
        return <Analytics />
      case 'settings':
        return <Settings />
      default:
        return <Dashboard />
    }
  }

  return (
    <Layout>
      {renderContent()}
    </Layout>
  )
}

export default App
