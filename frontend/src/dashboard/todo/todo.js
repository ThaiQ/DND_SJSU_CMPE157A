import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import GridList from '@material-ui/core/GridList';
import CreateIcon from '@material-ui/icons/Create';
import Item from './item'
import {bg} from '../data'

const useStyles = makeStyles((theme) => ({
    root: {

        flexWrap: 'wrap',
        justifyContent: 'space-around',
        overflow: 'hidden',
    },
    gridList: {
        width: 500,
        height: 450,
    },
}));

export default function ImageGridList() {

    const classes = useStyles();

    return (
        <div className={classes.root}>
            <h2 id='dashb-sub'>BIO</h2>
            <div id='dashb-sub'>{bg.bio}</div> 
            <br/>
            <div id='dashb-sub'>Traits: {bg.trait}</div>
            <div id='dashb-sub'>Flaws: {bg.flaw}</div>
            <div id='dashb-sub'>Ideals: {bg.ideal}</div>
        </div>
    );
}

