import React, {useEffect} from 'react'
import axios from 'axios'
import { useParams } from "react-router-dom";

const queryParams = new URLSearchParams(window.location.search);

async function get(){
    let player_data = null
    let bio_data = null
    let quipment_data = null
    let inventory_data = null
    let class_spell_data = null

    //Fetch info from Flask server
    await axios.get('http://localhost:5000',{
        params: {
            playerID: queryParams.get('user')
        }
      }).then((res)=>{
        player_data = res.data.playerdata
        bio_data = res.data.biodata
        quipment_data = res.data.equipmentdata
        inventory_data = res.data.inventorydata
        class_spell_data = res.data.classspelldata 
    })

    let stats = [player_data.constitution, player_data.strength, player_data.dexterity, player_data.intelligence,
        player_data.wisdom, player_data.charisma, 10]
    player_data = `${player_data.name} | ${player_data.class} - ${player_data.level} | Exp: ${player_data.experience} `
    return {
        player_data,bio_data,quipment_data,inventory_data,class_spell_data,stats
    }
}

/**
 * EXPORTS
 * info from database or default to placeholder
 */
export var spells = get().class_spell_data || [
    "Absorb Elements", "Alarm", "Animal Friendship", "Healing Hand"
]

export var items = get().inventory_data || [
    {
        name: "Amber",
        desc: "A transparent watery gold to rich gold gemstone worth 100 gold pieces.",
        stats: "12 pieces"
    },
    {
        name: "Amulet",
        desc: "A holy symbol is a representation of a god or pantheon.",
        stats: "Holy"
    }
]

export var eq_items = get().quipment_data || [
    {
        slot:"Chestplate",
        name:"Leather Armor",
        desc:"Light Armor",
        stats:"AC 10"
    }
]

export var stats = get().stats || [12, 16, 18, 12, 11, 20, 12]

export var bg = get().bio_data || {
    bio: "You have always been alone for as long as you can remember, whether you live in a forest or a village- people never really bothered you. Now you are forced to band with others because there becomes a point in survival where being alone is too much, and the best way to live safely is with others who care for you.",
    trait: "Able to convince anyone",
    ideal: "Chaotic",
    flaw: "Doesn't know about a lot of the world"
}

export var char = get().player_data || "Bob | Wizard - 12 | Exp: 100"