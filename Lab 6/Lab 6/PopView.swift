//
//  PopupView.swift
//  lab6ListAndNavigation
//
//  Created by Nick Kounavelis on 10/12/22.
//

import SwiftUI

struct PopupView: View {
    var d: ListItem = destinations[0]
    @State private var textDesc: String = ""
    
    var body: some View {
        VStack {
            Text(textDesc)
        }
        .task {
            outputDesc(p: d.image)
        }
    }
    
    func outputDesc(p: String)
    {
        if p == "Enchantments" {
            textDesc = "Surrounded by the high mountains of the Cascade Range, the Enchantments are a series of alpine lakes nested amongst glaciers, larch forests, and white granite."
        }
        else if p == "Glacier" {
            textDesc = "Climbing the edge of the Garden Wall, Grinnell Glacier is a fast-disappearing relic of the last Ice Age.  Its waters are sometimes filled with brightly colored cyanobacteria."
        }
        else if p == "Artist" {
            textDesc = "Varying ore oxides decorate the bald rocks in a palette-like manner, earning this hill its iconic name."
        }
        else if p == "Jacinto" {
            textDesc = "Much like Half Dome in Yosemite, Suicide Rock is a granite dome raised to the surface by tectonic forces.  It juts aggressively out the side of Mount San Jacinto, overlooking the Coachella Valley."
        }
        else if p == "Franconia" {
            textDesc = "A pass through the western section of the White Mountains, Franconia Notch is home to the narrowest section of interstate highway in the United States."
        }
        else if p == "Sandy" {
            textDesc = "Jutting out into the mouth of the Raritan River, Sandy Hook is a beach famous for its calm waters and views of New York City."
        }
        else if p == "Narrows" {
            textDesc = "Carved 500-feet deep into sandstone by the Virgin River, the Narrows are a series of walkable slot canyons which were first traversed on horseback by frontier explorers."
        }
        else if p == "Canyon" {
            textDesc = "The Grand Canyon, arguably the United States's most famous geographical feature, is over 5000 feet deep.  Layers of some of the world's oldest rock can be found at the bottom next to the Colorado River."
        }
        else {
            textDesc = "No data found!"
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    
    static var previews: some View {
        PopupView(d: destinations[0])
    }
}
