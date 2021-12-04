import React, { useState, useEffect } from 'react';
import './dashboard.css'
import Grid from './grid'
import Drawer from '../components/left-navbar/drawer'
import {char} from './data'

const Chart = require('chart.js')

export default function Profile(props) {

    //Making sure that user is login
    const [user, setUser] = useState(localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user')) : '');
    useEffect(() => {
        
        console.log(user)
    }, [])



    useEffect(() => {

    }, [])

    return (
        <div className='dashboard-app'>
            hi
            <Drawer title='Dashboard' content={Grid} user={char}/>
        </div>
    );
}
