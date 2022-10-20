//  DetailView.swift
//  lab6ListAndNavigation
//
//  Created by Nick Kounavelis on 10/12/22.
//

import SwiftUI

struct DetailView: View {
    var d: ListItem = destinations[0]
    @State var showPopup = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(d.image)
                    .resizable()
                    .frame(width: 360, height: 270)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .onTapGesture {
                        showPopup.toggle()
                    }
                    .sheet(isPresented: $showPopup, content: {
                        PopupView(d: destinations[0])
                    })
            }
                
            Text(d.title)
                .font(.title)
            
            Text(d.subtitle)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(d: destinations[0])
    }
}
