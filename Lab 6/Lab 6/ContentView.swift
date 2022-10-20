//  ContentView.swift
//  lab6ListAndNavigation
//
//  Created by Nick Kounavelis on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List (destinations) { d in
                NavigationLink (destination: DetailView (d: d)){
                    HStack {
                        VStack (alignment: .leading, spacing: 10) {
                            Text("\(d.title)")
                                .font(.system(size: 24, weight: .bold))
                            
                            Text("\(d.subtitle)")
                        } // end VStack
                            
                        Spacer()
                            
                        Image(d.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                } // end HStack
                
            } // end List
            .navigationBarTitle("My Travels")
            
        } // end NavigationView
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
}

var destinations = [
    ListItem(title: "The Enchantments", subtitle: "Okanogan-Wenatchee Nat'l Forest, Leavenworth, WA", image: "Enchantments"),
    ListItem(title: "Grinnell Glacier", subtitle: "Glacier Nat'l Park, Babb, MT", image: "Glacier"),
    ListItem(title: "Artist's Palette", subtitle: "Death Valley Nat'l Park, Furnace Creek, CA", image: "Artist"),
    ListItem(title: "Suicide Rock", subtitle: "Mount San Jacinto State Park, Palm Springs, CA", image: "Jacinto"),
    ListItem(title: "Franconia Notch", subtitle: "White Mountain Nat'l Forest, Lincoln, NH", image: "Franconia"),
    ListItem(title: "South Beach", subtitle: "Sandy Hook - Gateway Nat'l Recreation Area, Atlantic Highlands, NJ", image: "Sandy"),
    ListItem(title: "The Narrows", subtitle: "Zion Nat'l Park, Springdale, UT", image: "Narrows"),
    ListItem(title: "South Rim", subtitle: "Grand Canyon Nat'l Park, Williams, AZ", image: "Canyon")
]

/*
var capitals = [
    ListItem(title: "Athens",   subtitle: "The Acropolis",               image: "athens"),
    ListItem(title: "Berlin",   subtitle: "The Spree River",             image: "berlin"),
    ListItem(title: "Brussels", subtitle: "Home of NATO Headquaters",    image: "brussels"),
    ListItem(title: "Geneva",   subtitle: "Home of Swiss Army Knife",    image: "geneva"),
    ListItem(title: "Lisbon",   subtitle: "Hilly and Coastal Capital",   image: "lisbon"),
    ListItem(title: "London",   subtitle: "Great Fish n Chips",          image: "london"),
    ListItem(title: "Madrid",   subtitle: "Most Populous City in Spain", image: "madrid"),
    ListItem(title: "Ottawa",   subtitle: "The NHL Senators Play Here",  image: "ottawa"),
    ListItem(title: "Paris",    subtitle: "The Eiffel Tower",            image: "paris"),
    ListItem(title: "Rome",     subtitle: "The Colosseum",               image: "rome"),
    ListItem(title: "Santiago", subtitle: "Great Food and Hotels",       image: "santiago"),
    ListItem(title: "Tokyo",    subtitle: "Tokyo with Mtn Fuji",         image: "tokyo")
]
 */
