//
//  HeroWidgetHero.swift
//  HeroWidgetHero
//
//  Created by Enes Kaya on 12.08.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    
   // @AppStorage("hero", store: UserDefaults(suiteName: "group.com.wasabi.HeroWidget"))
    //var heroData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
       
        
        
            //  if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData)
                  let entry = SimpleEntry(date: Date(), configuration: configuration, hero: Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne"))
                  completion(entry)
        //      }
        
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        //if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData) {
                  let date = Date()
                  
                  let entry = SimpleEntry(date: date, configuration: configuration, hero: Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne"))

                  let timeline = Timeline(entries: [entry], policy: .never)
                  completion(timeline)
              }
              
         // }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hero : Superhero
}

struct HeroWidgetHeroEntryView : View {
    
    var entry: Provider.Entry

       var body: some View {
           CircularImageView(image: Image(entry.hero.image))
       }
}

@main
struct HeroWidgetHero: Widget {
    let kind: String = "Hero_Widget"

       var body: some WidgetConfiguration {
           
           IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
               HeroWidgetHeroEntryView(entry: entry)

           }
           .configurationDisplayName("Hero Widget")
           .description("Hero widget!!!!")
       }
}

