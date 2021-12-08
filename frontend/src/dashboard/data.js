import React, { useEffect } from 'react'
import axios from 'axios'
import { useParams } from "react-router-dom";

const queryParams = new URLSearchParams(window.location.search);

async function get() {
    let player_data = null
    let bio_data = null
    let quipment_data = null
    let inventory_data = null
    let class_spell_data = null
    let class_data = ["","Fighter"]

    //Fetch info from Flask server
    await axios.get('http://localhost:5000', {
        params: {
            playerID: queryParams.get('user')
        }
    }).then((res) => {
        player_data = res.data[0]
        bio_data = res.data[1]
        quipment_data = res.data[6]
        inventory_data = res.data[6]
        class_spell_data = res.data[8]
        class_data = res.data[5]
    })

    let stats = [player_data[5], player_data[6], player_data[7], player_data[8], player_data[9], player_data[10], player_data[11]]
    player_data = `${player_data[2]} | ${class_data[1]} - ${player_data[0]} | Exp: ${player_data[1]} `
    return {
        player_data, bio_data: {
            bio: bio_data[2],
            trait: bio_data[2],
            ideal: bio_data[1],
            flaw: bio_data[2]
        },

        quipment_data: [{
            name: quipment_data[1],
            desc: quipment_data[1],
            stats: quipment_data[2]
        }], 

        inventory_data: [{
            name: inventory_data[1],
            desc: inventory_data[1],
            stats: inventory_data[2]
        }],
        
        class_spell_data: [class_spell_data[2]], stats
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
        slot: "Chestplate",
        name: "Leather Armor",
        desc: "Light Armor",
        stats: "AC 10"
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