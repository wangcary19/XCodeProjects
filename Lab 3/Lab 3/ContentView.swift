//
//  ContentView.swift
//  Lab 3
//
//  Created by Cary Wang on 9/23/22.
//

import SwiftUI

struct ContentView: View {
    @State private var card1:String = "card1"
    @State private var card2:String = "card2"
    @State private var card3:String = "card3"
    @State private var card4:String = "card4"
    
    @State private var resultMessage:String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(card1)
                    .resizable()
                
                Image(card2)
                    .resizable()
            }
            
            HStack {
                Image(card3)
                    .resizable()
                
                Image(card4)
                    .resizable()
            }
            
            Button(action: {
                var randomNumber:Int = 0
                for i in 1...4{
                    if i == 1 {
                        randomNumber = Int.random(in:1...10)
                        card1 = "card" + String(randomNumber)
                    }
                    
                    resultMessage = "High :" + "\n" + "Low :" + "\n" + "Freq :"
                }
            }, label: {Text("RANDOM").padding().foregroundColor(Color.green).font(.largeTitle)
                
            })
            
            Text(resultMessage)
                .frame(width: 275, height: 70, alignment: .leading)
                .background(Color.green)
                .foregroundColor(Color.black)
        }
    }
}


//Driver
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
