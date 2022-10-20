//
//  ContentView.swift
//  Shelffle
//
//  Created by Cary Wang on 10/20/22.


//--------------------------------------------------------------------------------------------
import SwiftUI
import CoreData


//--------------------------------------------------------------------------------------------
//Global variables for viewing mode, font type, font size, and author randomization
var isLight: Bool = false
var font: String = ""
var size: Int = 16
var randomize_authors: Bool = true

//Custom colors for light and dark modes
extension Color {
    static let BackgroundColor = Color("BackgroundColor")
    static let TextColor = Color("TextColor") }


//--------------------------------------------------------------------------------------------
//User interface
struct ContentView: View {
    var body: some View {
        
        //Background
        ZStack {
            Color.BackgroundColor.ignoresSafeArea()
            
            //Text and settings
            VStack {
                
                //Title
                Text("Init").foregroundColor(Color.TextColor).bold()
                
                //Author, with live biography link
                
                
                //Poem
                
                /*
                //Settings
                HStack {
                    Button(<#T##title: StringProtocol##StringProtocol#>, action: <#T##() -> Void#>)
                    Button(<#T##title: StringProtocol##StringProtocol#>, action: <#T##() -> Void#>)
                } //end HStack for settings
                 */
                
            }//end VStack for text and settings
        }//end ZStack for background
    }//end body view
}//end ContentView


//--------------------------------------------------------------------------------------------
//Display driver code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if isLight == true {
            ContentView()
        }
        else {
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
