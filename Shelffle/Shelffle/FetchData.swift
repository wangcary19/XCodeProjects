//
//  FetchData.swift
//  Shelffle
//
//  Created by Cary Wang on 10/29/22.
//

import Foundation
import SwiftUI

var ListOfAuthors:[String] = ["Adam Lindsay Gordon","Alan Seeger","Alexander Pope","Algernon Charles Swinburne","Ambrose Bierce","Amy Levy","Andrew Marvell","Ann Taylor","Anne Bradstreet","Anne Bronte","Anne Killigrew","Anne Kingsmill Finch","Annie Louisa Walker","Arthur Hugh Clough",
    "Ben Jonson",
    "Charles Kingsley","Charles Sorley","Charlotte Bronte","Charlotte Smith","Christina Rossetti","Christopher Marlowe","Christopher Smart","Coventry Patmore",
    "Edgar Allan Poe","Edmund Spenser","Edward Fitzgerald","Edward Lear","Edward Taylor","Edward Thomas","Eliza Cook","Elizabeth Barrett Browning","Emily Bronte","Emily Dickinson","Emma Lazarus","Ernest Dowson","Eugene Field",
    "Francis Thompson",
    "Geoffrey Chaucer","George Eliot","George Gordon, Lord Byron","George Herbert","George Meredith","Gerard Manley Hopkins",
    "Helen Hunt Jackson","Henry David Thoreau","Henry Vaughan","Henry Wadsworth Longfellow","Hugh Henry Brackenridge",
    "Isaac Watts",
    "James Henry Leigh Hunt","James Thomson","James Whitcomb Riley","Jane Austen","Jane Taylor","John Clare","John Donne","John Dryden","John Greenleaf Whittier","John Keats","John McCrae","John Milton","John Trumbull","John Wilmot","Jonathan Swift","Joseph Warton","Joyce Kilmer","Julia Ward Howe","Jupiter Hammon",
    "Katherine Philips",
    "Lady Mary Chudleigh","Lewis Carroll","Lord Alfred Tennyson","Louisa May Alcott",
    "Major Henry Livingston, Jr.","Mark Twain","Mary Elizabeth Coleridge","Matthew Arnold","Matthew Prior","Michael Drayton",
    "Oliver Goldsmith","Oliver Wendell Holmes","Oscar Wilde",
    "Paul Laurence Dunbar","Percy Bysshe Shelley","Philip Freneau","Phillis Wheatley",
    "Ralph Waldo Emerson","Richard Crashaw","Richard Lovelace","Robert Browning","Robert Burns","Robert Herrick","Robert Louis Stevenson","Robert Southey","Robinson","Rupert Brooke",
    "Samuel Coleridge","Samuel Johnson","Sarah Flower Adams","Sidney Lanier","Sir John Suckling","Sir Philip Sidney","Sir Thomas Wyatt","Sir Walter Raleigh","Sir Walter Scott","Stephen Crane",
    "Thomas Campbell","Thomas Chatterton","Thomas Flatman","Thomas Gray","Thomas Hood","Thomas Moore","Thomas Warton",
    "Walt Whitman","Walter Savage Landor","Wilfred Owen","William Allingham","William Barnes","William Blake","William Browne","William Cowper","William Cullen Bryant","William Ernest Henley","William Lisle Bowles","William Morris","William Shakespeare","William Topaz McGonagall","William Vaughn Moody","William Wordsworth"]

struct Poem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let lines: [String]
}

class API {
    func getTitles(completion: @escaping ([Poem]) -> ()) {
        //Randomly select an author and get a list of their works
        let seed = Int.random(in: 0...ListOfAuthors.count)
        let author = ListOfAuthors[seed]
        let authorURL = author.replacingOccurrences(of: " ", with: "%20")
        
        guard let titlesURL = URL(string: "https://poetrydb.org/author/" + authorURL + "/title,lines") else {
            print("Failed to get list of titles for " + ListOfAuthors[seed] + ", URL invalid.")
            return
        }
        
        URLSession.shared.dataTask(with: titlesURL) { (data, _, _) in
            let decodedData = try! JSONDecoder().decode([Poem].self, from: data!)
            
            DispatchQueue.main.async {
                completion(decodedData)
            }
        }
        .resume()
    }
}
