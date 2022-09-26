//  ContentView.swift
//  Lab 3
//
//  Cary Wang, for Professor Kounavelis's CISC 5140 Mobile Device Programming
//  9/25/2023

import SwiftUI

struct ContentView: View {
    
    @State var vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @State var suits = ["c","s","h","d","c","s","h","d","c","s"]
    @State var names:[String] = ["1c","2s","3h","4d","5c","6s","7h","8d","9c","10s"]
    
    @State var high:String = "High card: "
    @State var low:String = "Low card: "
    @State var sum:String = "Sum: "
    @State var freq:String = "Freq: "
    @State var highpos:String = "Pos# of High: "
    @State var lowpos:String = "Pos# of Low: "
    
    var body: some View {
        VStack {
            HStack {
                Image(names[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(names[1])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Image(names[2])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(names[3])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Image(names[4])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(names[5])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Image(names[6])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(names[7])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Image(names[8])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(names[9])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Button(action: {
                high = "High Card: "
                low = "Low Card: "
                sum = "Sum: "
                freq = "Freq: "
                highpos = "Pos# of High: "
                lowpos = "Pos# of Low: "
                
                for i in 0...9{
                    vals[i] = (Int.random(in:0...13)) //Add card value to array
                    
                    var suit:Int = Int.random(in:1...4) //Add card suit to array
                    if suit == 1 {
                        suits[i] = "c"
                    }
                    else if suit == 2 {
                        suits[i] = "s"
                    }
                    else if suit == 3 {
                        suits[i] = "h"
                    }
                    else {
                        suits[i] = "d"
                    }
                }
                
                //Populate names array
                for i in 0...9 {
                    names[i] = String(vals[i]) + suits[i]
                }
                
                var messages:[String] = resultMessage(values: vals, suits: suits, cards: names)
                high = high + messages[0]
                low = low + messages[1]
                sum = sum + messages[2]
                freq = freq + messages[3]
                highpos = highpos + messages[4]
                lowpos = lowpos + messages[5]
                
            },
                   label: {Text("Click to randomize!").foregroundColor(Color.green).font(.headline)
            })
            Spacer()
            HStack {
                Spacer()
                VStack (alignment: .leading, spacing: 2){
                    Text(high)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text(sum)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text(highpos)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack (alignment: .leading, spacing: 2) {
                    Text(low)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text(freq)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text(lowpos)
                        .foregroundColor(Color.black)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    
                }
                Spacer()
            }
        }
    }
}

//Driver
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
