//
//  ResultMessage.swift
//  Lab 3
//
//  Created by Cary Wang on 9/25/22.
//

import Foundation

func commonElementsInArray(stringArray: [String]) -> String {
    let dict = Dictionary(grouping: stringArray, by: {$0})
    let newDict = dict.mapValues({$0.count})
    return newDict.sorted(by: {$0.value > $1.value}).first?.key ?? ""
}

func resultMessage(values:[Int], suits:[String], cards:[String]) -> [String] {
    
    var sum:Int = 0
    
    var max:Int = values[0]
    var min:Int = values[0]
    var max_pos:Int = 0
    var min_pos:Int = 0
    
    var freq:String = commonElementsInArray(stringArray:cards)
    var freq2:String = freq
    var freq_val:Int? = Int(freq.dropLast())
    var freq_abbrev:String = String(freq2.dropFirst(2))
    var h:String = ""
    var l:String = ""
    
    for i in 0...9 {
        
        sum = sum + values[i] //Calculate sum
        
        if values[i] > values[max_pos] { //Check for max
            max = values[i]
            max_pos = i
        }
        if values[i] < values[min_pos] { //Check for min
            min = values[i]
            min_pos = i
        }
    }
    
    h = findName(val: max, abbrev: suits[max_pos])
    l = findName(val: min, abbrev: suits[min_pos])
    var out_sum:String = (String(sum))
    var out_freq:String = findName(val: freq_val!, abbrev: freq_abbrev)
    var out_maxpos:String = String(max_pos + 1)
    var out_minpos:String = String(min_pos + 1)
    
    
    return [h, l, out_sum, out_freq, out_maxpos, out_minpos]
}

func findSuit(val:Int, abbrev:String) -> String {
    if val == 0 {
        if abbrev == "c" || abbrev == "s" {
            return "Black"
        }
        else {
            return "Red"
        }
    }
    else if abbrev == "c" {
        return " of clubs"
    }
    else if abbrev == "s" {
        return " of spades"
    }
    else if abbrev == "h" {
        return " of hearts"
    }
    else {
        return " of diamonds"
    }
}

func findName(val:Int, abbrev:String) -> String {
    if val == 0 {
        return findSuit(val:val, abbrev:abbrev) + " Joker"
    }
    else if val == 13 {
        return "K" + findSuit(val:val, abbrev:abbrev)
    }
    else if val == 12 {
        return "Q" + findSuit(val:val, abbrev:abbrev)
    }
    else if val == 11 {
        return "J" + findSuit(val:val, abbrev:abbrev)
    }
    else if val == 1 {
        return "Ace" + findSuit(val:val, abbrev:abbrev)
    }
    else {
        return String(val) + findSuit(val:val, abbrev:abbrev)
    }
}
