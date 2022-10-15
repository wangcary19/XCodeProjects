//
//  WeatherData.swift
//  Lab 5
//
//  Created by Cary Wang on 10/15/22.
//

import Foundation
import SwiftUI
import SWXMLHash
import UIKit

struct WeatherData {
    var location: String = ""
    var temp_f: String = ""
    var temp_c: String = ""
    var station_id: String = ""
    var visibility_mi: String = ""
    var dewpoint_f: String = ""
    var dewpoint_c: String = ""
}

class WeatherParser: NSObject, XMLParserDelegate {
    
    /*var parser = XMLParser()

    func getData(cityCode: String) async {

        let urlString = "http://w1.weather.gov/xml/current_obs/" + cityCode + ".xml"
        var url = URL(string: urlString)
        let task = URLSession.shared.downloadTask(with: url!)
        self.parser = XMLParser(contentsOf: url!)!
        self.parser.delegate = self
        let success:Bool = self.parser.parse()
        if success {
            print("success")
        } else {
            print("parse failure!")
        }
    }
    
    //Parser
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]){
        if(elementName == "current_observation") {
            for s in attributeDict {
                switch s.key {
                case "location":
                    location = s.value
                    break
                case "station_id":
                    station_id = s.value
                    break
                case "temp_f":
                    temp_f = s.value
                    break
                case "temp_c":
                    temp_c = s.value
                    break
                case "dewpoint_f":
                    dewpoint_f = s.value
                    break
                case "dewpoint_c":
                    dewpoint_c = s.value
                    break
                case "visibility_mi":
                    visibility_mi = s.value
                    break
                default:
                    break
                }
            }
        }
    }
    
    //Parser error output
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("Error code: ", parseError)
    }
    */
}

