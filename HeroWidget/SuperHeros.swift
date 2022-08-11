//
//  SuperHeros.swift
//  HeroWidget
//
//  Created by Enes Kaya on 11.08.2022.
//

import Foundation

struct Superhero : Identifiable, Codable {
    
    let image : String
    let name : String
    let realName : String
    
    var id : String {image}
}

let superman = Superhero(image: "superman", name: "Superman", realName: "Clark Kent")

let batman = Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne")

let ironman = Superhero(image: "ironman", name: "Iron Man", realName: "Tony Stark")
