import React,{useEffect, useState} from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import ListItemText from '@material-ui/core/ListItemText';
import Checkbox from '@material-ui/core/Checkbox';
import IconButton from '@material-ui/core/IconButton';
import CommentIcon from '@material-ui/icons/Comment';
import '../dashboard.css'

const useStyles = makeStyles((theme) => ({
  root: {
    width: '100%',
    maxWidth: 360,
    backgroundColor: 'rgb(35, 48, 68)',
    color: 'white'
  },
}));

export default function CheckboxList() {
  const classes = useStyles();
  const [status, setStatus] = useState(false);
  //const [todo,setTodo] = useState(data.todo);


  useEffect(()=>{},[])



  function styleDue(value){
    if (value < 3){
      return {color: 'rgb(253, 18, 18)',backgroundColor:'rgba(235, 178, 178, 0.15)'}
    }
    else{
      return {color: 'rgb(0, 255, 0)',backgroundColor:'rgba(140, 245, 140, 0.15)'}
    }
  }

  return (
    <List className={classes.root}>
      
    </List>
  );
}
