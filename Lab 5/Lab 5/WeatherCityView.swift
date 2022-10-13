// Cary Wang, for Professor Kounavelis's CISC 5140
// October 12th, 2022

import SwiftUI

struct WeatherCityView: View {
    
    var cityCode: String
    
    let urlString = "http://w1.weather.gov/xml/current_obs/" + cityCode + ".xml"
    guard let url = URL(string: urlString)
    else {
        print("Hey Man, THIS URL DOES NOT WORK!")
        exit(-1)
    }
        
    // Perform HTTP Request
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        // Check for Error
        if let error = error {
            print("Error took place \(error)")
            exit(-2)
        }
         
        // Convert HTTP Response Data to a String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                
            print("\(dataString)")
                    
        } // end let data
    }
                    
    task.resume()
    
    var body: some View {
        
    }
}
