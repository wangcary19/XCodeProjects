//
//  ContentView.swift
//  weatherCities
//
//  Created by Nick Kounavelis on 10/5/22.
//

import SwiftUI

struct ContentView: View {

    @State private var cityCode: String = ""
    
    var body: some View {
                
        NavigationView {
                    
           VStack {
               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KBOS")) {
                           Text("BOSTON")
                               .padding()
                               .foregroundColor(Color.blue)
                               .font(.largeTitle)
                   }
               }) // end button
               
               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KNYC")) {
                       Text("NEW YORK CITY")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               }) // end button

               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KMIA")) {
                       Text("MIAMI")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               }) // end button
            
               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KDAL")) {
                       Text("DALLAS")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               })
               
               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KDEN")) {
                       Text("DENVER")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               })
               
               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KLAX")) {
                       Text("LOS ANGELES")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               })
               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KSEA")) {
                       Text("SEATTLE")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               })
               Button(action: {} , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KDET")) {
                       Text("DETROIT")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               })
           } // end VStack
           .navigationTitle("Weather - Cities")
                    
        } // end navigation view
        
    } // end body
     
} // end struct


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
