//
//  CurrencyView.swift
//  lab#4MobileProject
//
//  Created by Cary Wang on 10/5/22.
//

import SwiftUI

struct Currency: Decodable {
    let name: String
    let code: String
}

struct CurrencyView: View {
    @State private var currencies = [Currency]()
    
    var body: some View {
        NavigationView {
            List (currencies, id: \.name){ c in
                VStack (alignment: .leading) {
                    Text(c.name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(c.code)
                        .font(.body )
                        .foregroundColor(.cyan)
                    /*Text(c.Info.symbol)
                        .font(.body)
                        .foregroundColor(.indigo)*/
                }
            }
            .navigationTitle("Int'l Currencies")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        // create the URL
        guard let url = URL(string: "https://raw.githubusercontent.com/wangcary19/temp/main/currency-list.json?token=GHSAT0AAAAAABY63JQCXRNPXBH3JJXWMDZOYZ56OFQ") else {
            print("Hey Man, THIS URL DOES NOT WORK!")
            return
        }
        
        // fetch the data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode that data
            if let decodedResponse = try? JSONDecoder().decode([Currency].self, from: data) {
                currencies = decodedResponse
            }
        } catch {
            print("Bad news ... This data is not valid :-(")
        }
        // decode the data
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
