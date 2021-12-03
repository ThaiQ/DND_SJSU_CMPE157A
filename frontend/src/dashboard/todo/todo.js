import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import GridList from '@material-ui/core/GridList';
import CreateIcon from '@material-ui/icons/Create';
import Item from './item'

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

/**
 * The example data is structured as follows:
 *
 * import image from 'path/to/image.jpg';
 * [etc...]
 *
 * const tileData = [
 *   {
 *     img: image,
 *     title: 'Image',
 *     author: 'author',
 *     cols: 2,
 *   },
 *   {
 *     [etc...]
 *   },
 * ];
 */

const tileData = [
    {
        text: 'https://www.imgacademy.com/themes/custom/imgacademy/images/helpbox-contact.jpg',
        title: 'Image',
        author: 'author',
        cols: 2,
    },
]

const bg= {
    bio: "You have always been alone for as long as you can remember, whether you live in a forest or a village- people never really bothered you. Now you are forced to band with others because there becomes a point in survival where being alone is too much, and the best way to live safely is with others who care for you.",
    trait: "Able to convince anyone",
    ideal: "Chaotic",
    flaw: "Doesn't know about a lot of the world"
}

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

