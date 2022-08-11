//
//  ContentView.swift
//  HeroWidget
//
//  Created by Enes Kaya on 11.08.2022.
//

import SwiftUI
import WidgetKit


let superHeroArray = [superman,batman,ironman]

struct ContentView: View {
    
    
    
    var body: some View {
        VStack{
            ForEach(superHeroArray) { hero in
                
                HeroView(hero: hero).onTapGesture {
                    saveToDefaults(hero: hero)
                }
                
            }
        }
    }
    
    func saveToDefaults(hero : Superhero) {
        //print(hero.name)
        if let heroData = try? JSONEncoder().encode(hero) {

            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "Hero_Widget")

        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
