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
var fsize: CGFloat = 16
var randomize_authors: Bool = true

//Custom colors for light and dark modes
extension Color {
    static let BackgroundColor = Color("BackgroundColor")
    static let TextColor = Color("TextColor")
    static let AuthorColor = Color("AuthorColor")
}


//--------------------------------------------------------------------------------------------
//User interface
struct ContentView: View {
    var body: some View {
        
        //Background
        ZStack {
            Color.BackgroundColor.ignoresSafeArea()
            //Text and settings
            VStack {
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                //Title
                HStack {
                    Spacer()
                    Text("Hope is the thing with feathers")
                        .foregroundColor(Color.TextColor)
                        .bold()
                        .font(.title)
                        .frame(width: 360, height: 75, alignment: .topLeading)
                }
                
                //Author, with live biography link
                HStack {
                    Spacer()
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Text("Emily Dickinson")
                            .foregroundColor(Color.AuthorColor)
                            .frame(alignment: .topLeading)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                //Poem
                ScrollView {
                    HStack {
                        Spacer()
                        Text("\"Hope\" is the thing with feathers \n That perches in the soul - \n And sings the tune without the words \n And never stops at all - ")
                            .foregroundColor(Color.TextColor)
                            .bold()
                            .font(.system(size: fsize))
                            .frame(width: 360, height: 360, alignment: .topLeading)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                //Settings
                HStack {
                    Spacer()
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: "arrow.clockwise.circle.fill")
                    }
                    Spacer()
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: "filemenu.and.selection")
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                } //end HStack for settings
                
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
