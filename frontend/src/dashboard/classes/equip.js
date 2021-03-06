import React, { useState, useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import '../dashboard.css'
import {eq_items} from '../data'

const axios = require('axios')

const useStyles = makeStyles({
    table: {
        minWidth: 650,
        color: 'white !important'
    }
});

export default function EquipTable() {
    const classes = useStyles();

    useEffect(()=>{
    },[])

    let items = eq_items

    function navCourse(href){
        window.location.href=href
    }

    // async function getCourses(){
    //     let courses = await axios.post('https://bvr02h55bk.execute-api.us-east-1.amazonaws.com/Prod/getCourse', JSON.stringify({}))
    //     setCourses(courses.data.Items)
    // }

    return (
        <div>
        <TableContainer id='dash-table' component={Paper}>
            <Table className={classes.table} aria-label="simple table">
                <TableHead>
                    <TableRow>
                        <TableCell align="left">Slot</TableCell>
                        <TableCell align="left">Name</TableCell>
                        <TableCell align="left">Desciption</TableCell>
                        <TableCell align="left">Stats</TableCell>
                    </TableRow>
                </TableHead>
                <TableBody>
                    {items?items.map((row, ind) => (
                        <TableRow key={ind} className='dash-class-cell' onClick={()=>{navCourse('coursedashboard/'+row.CourseID)}}>
                            <TableCell align="left">{row.slot}</TableCell>
                            <TableCell align="left">{row.name}</TableCell>
                            <TableCell align="left">{row.desc}</TableCell>
                            <TableCell align="left">{row.stats}</TableCell>
                        </TableRow>
                    )):''}
                </TableBody>
            </Table>
        </TableContainer>
        </div>
    );
}
