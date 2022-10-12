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
                   
               //--------------------------------------------------------------------
               Button(action: {
                       
                        // no Swift code yet
                       
               } , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KBOS")) {
                           Text("BOSTON")
                               .padding()
                               .foregroundColor(Color.blue)
                               .font(.largeTitle)
                   }
               }) // end button
               
               //---------------------------------------------------------------------
               Button(action: {
                   
                    // no Swift code yet
                   
               } , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KNYC")) {
                       Text("NEW YORK CITY")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               }) // end button
            
               //---------------------------------------------------------------------
               Button(action: {
                   
                    // no Swift code yet
                   
               } , label: {
                   NavigationLink(destination: WeatherCityView(cityCode: "KMIA")) {
                       Text("MIAMI")
                           .padding()
                           .foregroundColor(Color.blue)
                           .font(.largeTitle)
                   }
               }) // end button
                
           } // end VStack
           .navigationTitle("WEATHER - CITIES")
                    
        } // end navigation view
        
    }
    // end body
     
} // end struct


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
