//
//  ContentView.swift
//  Test
//
//  Created by Cary Wang on 10/15/22.
//

import SwiftUI
import CoreData
import SWXMLHash



func getXMLString() -> String {
    var url = URL(string: "http://w1.weather.gov/xml/current_obs/KBOS.xml")
    var out:String = ""
        
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error != nil {
            exit(-2)
        }

        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print(dataString)
            out = dataString
        }
    }
    task.resume()
    
    return out
}

struct ContentView: View {
    
    @State var test_xml = getXMLString()
    
    var body: some View {
        let xml = XMLHash.config {
            config in
            config.shouldProcessNamespaces = true
        }.parse(test_xml)
        
        VStack() {
            Text("Fuck you bitch ass")
            //Text(test_xml["location"].element!.text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
