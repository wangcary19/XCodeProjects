//
//  WeatherCityView.swift
//  weatherCities
//
//  Created by Nick Kounavelis on 10/5/22.
//

import SwiftUI

struct WeatherCityView: View {
    @State var cityCode:String
    
    @State private var title:String              = ""
    @State private var cityPicture:String        = ""
    @State private var xmlWeatherTagData: String = ""
    @State private var xmlLocationTagData: String = ""
    @State private var xmlTempFTagData: String = ""
    @State private var xmlTempCTagData: String = ""
    @State private var xmlStationTagData: String = ""
    @State private var xmlVisTagData: String = ""
    @State private var xmlDewFTagData: String = ""
    @State private var xmlDewCTagData: String = ""
    @State private var weatherPicture:String     = ""
    @State private var xmlData:String            = ""
    
    var body: some View {
        VStack {
            Text("Station " + xmlStationTagData).fontWeight(.medium)
            Text("@ " + xmlLocationTagData)
            Image(cityPicture)
                .resizable()
            Text(title)
            Spacer()
            Text(xmlWeatherTagData)
            Text("Temperature: " + xmlTempFTagData + " °F / " + xmlTempCTagData + " °C")
            Text("Dewpoint: " + xmlDewFTagData + " °F / " + xmlDewCTagData + " °C")
            Text("Visibility: " + xmlVisTagData + "mi")
        }
        .task {
            await fetchWeatherData(cityCode: cityCode)
        }
    } // end body
    
    func fetchWeatherData(cityCode: String) async {
        // create the URL
        xmlStationTagData = cityCode
        
        let urlString = "http://w1.weather.gov/xml/current_obs/" + cityCode + ".xml"
        
        guard let url = URL(string: urlString)
        else {
            print("Hey Man, THIS URL DOES NOT WORK!")
            return
        }
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                //
                // variables to use
                //
                var tempString     = ""
                var weatherTagData = ""
            
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    
                    //
                    // get the <weather> tag data
                    //
                    var tokens = dataString.components(separatedBy: "weather>")
                    var arraySize = tokens.count
                    if arraySize >= 2 {
                        var counter = 1
                        for xmlWeatherLine in tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            counter = counter + 1
                        }
                        
                        xmlWeatherTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    //
                    // get the <location> tag data
                    //
                    let l_tokens = dataString.components(separatedBy: "location>")
                    arraySize = l_tokens.count
                    if arraySize >= 2 {
                        var counter = 1
                        for xmlWeatherLine in l_tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            counter = counter + 1
                        }
                        
                        xmlLocationTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    //
                    // get the <temp_f> tag data
                    //
                    let tf_tokens = dataString.components(separatedBy: "temp_f>")
                    arraySize = tf_tokens.count
                    if arraySize >= 2 {
                        var counter = 1
                        for xmlWeatherLine in tf_tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            counter = counter + 1
                        }
                        
                        xmlTempFTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    //
                    // get the <temp_c> tag data
                    //
                    let tc_tokens = dataString.components(separatedBy: "temp_c>")
                    arraySize = tc_tokens.count
                    if arraySize >= 2 {
                        var counter = 1
                        for xmlWeatherLine in tc_tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            counter = counter + 1
                        }
                        
                        xmlTempCTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    //
                    // get the <visibility_mi> tag data
                    //
                    let v_tokens = dataString.components(separatedBy: "visibility_mi>")
                    arraySize = v_tokens.count
                    if arraySize >= 2 {
                        var counter = 1
                        for xmlWeatherLine in v_tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            counter = counter + 1
                        }
                        
                        xmlVisTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    //
                    // get the <dewpoint_f> tag data
                    //
                    let df_tokens = dataString.components(separatedBy: "dewpoint_f>")
                    arraySize = df_tokens.count
                    if arraySize >= 2 {
                        var counter = 1
                        for xmlWeatherLine in df_tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            counter = counter + 1
                        }
                        
                        xmlDewFTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    //
                    // get the <dewpoint_c> tag data
                    //
                    let dc_tokens = dataString.components(separatedBy: "dewpoint_c>")
                    arraySize = dc_tokens.count
                    if arraySize >= 2 {
                        var counter = 1
                        for xmlWeatherLine in dc_tokens {
                            if counter == 2 {
                                tempString = xmlWeatherLine
                            }
                            counter = counter + 1
                        }
                        
                        xmlDewCTagData = tempString.replacingOccurrences(of: "</", with: "", options: .literal, range: nil)
                    }
                    
                    if cityCode == "KBOS" {
                        title             = "BOSTON SKYLINE"
                        cityPicture       = "Boston"
                        weatherPicture    = "Rain"
                    }
                    else if cityCode == "KNYC" {
                        title             = "NEW YORK CITY SKYLINE"
                        cityPicture       = "NYC"
                        weatherPicture    = "Overcast"
                    }
                    else if cityCode == "KMIA" {
                        title             = "MIAMI SKYLINE"
                        cityPicture       = "Miami"
                        weatherPicture    = "Sunny"
                    }
                    else if cityCode == "KDAL" {
                        title             = "DALLAS SKYLINE"
                        cityPicture       = "Dallas"
                        weatherPicture    = "Sunny"
                    }
                    else if cityCode == "KDEN" {
                        title             = "DENVER SKYLINE"
                        cityPicture       = "Denver"
                        weatherPicture    = "Sunny"
                    }
                    else if cityCode == "KLAX" {
                        title             = "DENVER SKYLINE"
                        cityPicture       = "LA"
                        weatherPicture    = "Sunny"
                    }
                    else if cityCode == "KSEA" {
                        title             = "SEATTLE SKYLINE"
                        cityPicture       = "Seattle"
                        weatherPicture    = "Sunny"
                    }
                    else if cityCode == "KDET" {
                        title             = "DETROIT SKYLINE"
                        cityPicture       = "Detroit"
                        weatherPicture    = "Sunny"
                    }
                } // end let data
                    
        }
        task.resume()
        
    } // end function
}

struct WeatherCityView_Previews: PreviewProvider {
    
    @State static var cityCode: String = ""
    
    static var previews: some View {
        WeatherCityView(cityCode: cityCode)
    }
}
