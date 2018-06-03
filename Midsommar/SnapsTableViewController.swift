//
//  SnapsTableViewController.swift
//  Midsommar
//
//  Created by Hanna Östling on 2018-06-03.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import UIKit

class SnapsTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchController: UISearchController!
    var searchResult: [String] = []
    var songTitles: [String] = []
    var songLyrics: [String] = []
    var songMelodies: [String] = []
    var song: [[String:String]] = [
        [
            "songTitle": "Helan går",
            "songLyric": "Helan går, \n sjung hopp falleri faderallan lej, \n helan går, \n sjung hopp faderallan lej \n Och den som inte helan tar \n han inte heller halvan får \n Helan gåååååååår \n sjung hopp faderallan lej. \n \n Halvan går, \n sjung hopp falleri faderallan lej, \n helan går, \n sjung hopp faderallan lej \n Och den som inte halvan tar \n han inte heller tersen får \n Helan gåååååååår \n sjung hopp faderallan lej.",
            "songMelody": "Helan går"
        ],
        [
            "songTitle": "Serenat",
            "songLyric": "Så skön som liljan uppå sin stängel \n står supen där som en långbent ängel. \n Och härligt iskall och upphälld nyss \n så smakar den som en änglakyss.",
            "songMelody": "En sockerbagare"
        ],
        [
            "songTitle": "Leah",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "Tre"
        ],
        [
            "songTitle": "Sonja",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "Fyra"
        ],
        [
            "songTitle": "Noel",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "Fem"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Snappsvisor"
        definesPresentationContext = true
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Sök"
        navigationItem.searchController = searchController
        for songs in song {
            if let songTitle = songs["songTitle"] {
                songTitles.append(songTitle)
            }
            if let songLyric = songs["songLyric"] {
                songLyrics.append(songLyric)
            }
            if let songMelody = songs["songMelody"] {
                songMelodies.append(songMelody)
            }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text?.lowercased() {
            searchResult = songTitles.filter({ $0.lowercased().contains(text) })
        } else {
            searchResult = []
        }
        tableView.reloadData()
    }
    
    var shouldUseSearchResult : Bool {
        if let text = searchController.searchBar.text {
            if text.isEmpty {
                return false
            } else {
                return searchController.isActive
            }
        } else {
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldUseSearchResult {
            return searchResult.count
        } else {
            return songTitles.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SnapsTableViewCell
        let array : [String]
        if shouldUseSearchResult {
            array = searchResult
        } else {
            array = songTitles
        }
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSnapsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! SnapsViewController
                destVC.titleText = songTitles[indexPath.row]
                destVC.lyricText = songLyrics[indexPath.row]
                destVC.melodyText = "Melodi: " + songMelodies[indexPath.row]
            }
        }
    }
    
}
