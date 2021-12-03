import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import { Route, Switch, BrowserRouter as Router } from 'react-router-dom';

// Route Types
import PublicRoute from './routes/PublicRoute';


// Pages
import Dashboard from './dashboard/dashboard'


//User: register, login, browse, payments
//Admin: inventory, transactions, accounts

const routing = (
  <Router>
    <div>
      <Switch>
        <PublicRoute exact path="/" component={Dashboard} />
      </Switch>
    </div>
  </Router>
)

ReactDOM.render(
  routing,
  document.getElementById('root')
);
