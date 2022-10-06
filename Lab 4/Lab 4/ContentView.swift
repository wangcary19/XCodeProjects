//
//  ContentView.swift
//  lab#4MobileProject
//
//  Created by Nick Kounavelis on 9/28/22.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // 1) First JSON URL  ------------
                NavigationLink(destination: BreakingBadView()) {
                     Text("Breaking Bad")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
                
                
                // 2) Second JSON URL  ------------
                NavigationLink(destination: CurrencyView()) {
                     Text("World Currency Abbreviations")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
            
                // 3) Third JSON URL  ------------
                NavigationLink(destination: TodosView()) {
                     Text("TO DO LIST")
                        .font(.title3)
                        .padding(.bottom, 15)
                }
                
            }  // end vertical Stack
            .navigationTitle("JSON SAMPLE URLs")
            
        } // end navigation view
        
    } // end body
    
} // end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
