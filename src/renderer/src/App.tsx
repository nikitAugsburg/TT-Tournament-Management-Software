import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import './App.css';

// Core shell components
import NavigationBar from './components/NavigationBar';
import SidePanel from './components/SidePanel';
import MainContentArea from './components/MainContentArea';
import StatusBar from './components/StatusBar';
import ModalSystem from './components/ModalSystem';
import NotificationSystem from './components/NotificationSystem';

// Placeholder pages
import Tournaments from './pages/Tournaments';
import Players from './pages/Players';
import Matches from './pages/Matches';
import Settings from './pages/Settings';

/**
 * Main App component composing the core shell and routing.
 */
function App() {
  return (
    <Router>
      <div className="AppShell">
        <NavigationBar />
        <SidePanel />
        <MainContentArea>
          <Routes>
            <Route path="/tournaments" element={<Tournaments />} />
            <Route path="/players" element={<Players />} />
            <Route path="/matches" element={<Matches />} />
            <Route path="/settings" element={<Settings />} />
            {/* Redirect root to tournaments */}
            <Route path="/" element={<Navigate to="/tournaments" replace />} />
          </Routes>
        </MainContentArea>
        <StatusBar />
        <ModalSystem />
        <NotificationSystem />
      </div>
    </Router>
  );
}

export default App;
