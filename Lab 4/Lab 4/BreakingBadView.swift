//
//  BreakingBadView.swift
//  lab#4MobileProject
//
//  Created by Nick Kounavelis on 9/28/22.
//

import SwiftUI

struct Quote: Decodable {
    var quote_id: Int
    var quote:    String
    var author:   String
    var series:   String
}

struct BreakingBadView: View {
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView {
            List(quotes, id: \.quote_id) { q in
                VStack (alignment: .leading) {
                Text(q.author)
                    .font(.headline)
                    .foregroundColor(.cyan)
                Text(q.quote)
                    .font(.body)
                    .foregroundColor(.indigo)
                Text(q.series)
                    .font(.body)
                    .foregroundColor(.red)
                    
                }
            }
            .navigationTitle("Breaking Bad Quotes")
            .task {
                await fetchData()
            }
        }
    }
    
    
    func fetchData() async {
        // create the URL
        guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes") else {
            print("Hey Man, THIS URL DOES NOT WORK!")
            return
        }
        
        // fetch the data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode that data
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data) {
                quotes = decodedResponse
            }
        } catch {
            print("Bad news ... This data is not valid :-(")
        }
        
        // ecode the data
    }
}

struct BreakingBadView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadView()
    }
}
