//
//  ContentView.swift
//  MDP
//
//  Created by Cary Wang on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "username";
    @State var pass: String = "password";
    @State private var speed = 50.0;
    @State private var isEditing = false;
    var body: some View {
        ZStack {
            Image("pirate")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Spacer()
                Spacer()
                HStack {
                    Text("Login")
                        .font(.system(size: 48, weight: .light))
                        .bold()
                        .underline()
                        .foregroundColor(Color.white)
                        .padding(.leading, 30)
                        .padding(.bottom, 1)
                    Spacer()
                }
                HStack {
                    Text("Credentials lost?")
                        .padding(.leading, 30)
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(Color.white)
                    Button("Click here") {
                    }
                        //.padding(.leading, 30)
                        .font(.system(size: 12, weight: .light))
                        .ignoresSafeArea()
                }
                HStack {
                    Spacer()
                    TextField("Placeholder Text", text: $name)
                                .padding(.all, 10)
                                .foregroundColor(Color.white)
                                .border(Color.white)
                    Spacer()
                }
                HStack {
                    Spacer()
                    TextField("Placeholder Text", text: $pass)
                                .padding(.all, 10)
                                .foregroundColor(Color.white)
                                .border(Color.white)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Spacer()
                    Button("Enter >") {
                    }
                        .padding(.all, 10)
                        .foregroundColor(Color.white)
                        .border(Color.white)
                    Spacer()
                }
                VStack {
                        Slider(
                            value: $speed,
                            in: 0...100,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                        Text("\(speed)")
                            .foregroundColor(isEditing ? .white : .white)
                    }
                Spacer()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
