import React from 'react';
import { NavLink } from 'react-router-dom';

/**
 * NavigationBar component for main navigation between modules.
 */
const NavigationBar: React.FC = () => {
  return (
    <nav className="NavigationBar">
      {/* Navigation links for main modules */}
      <NavLink to="/tournaments" className={({ isActive }) => isActive ? 'active' : ''}>
        Tournaments
      </NavLink>
      <NavLink to="/players" className={({ isActive }) => isActive ? 'active' : ''}>
        Players
      </NavLink>
      <NavLink to="/matches" className={({ isActive }) => isActive ? 'active' : ''}>
        Matches
      </NavLink>
      <NavLink to="/settings" className={({ isActive }) => isActive ? 'active' : ''}>
        Settings
      </NavLink>
    </nav>
  );
};

export default NavigationBar; 