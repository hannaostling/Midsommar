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
            "songTitle": "Ser du stjärnan?",
            "songLyric": "Ser du stjärnan i det blå?... \n Äh, skit detsamma! \n Skål!",
            "songMelody": "Ser du stjärnan i det blå?"
        ],
        [
            "songTitle": "Mardrömmen",
            "songLyric": "Tänk om det inte fanns nån sup till \n midsommarsillen vi äter. \n Tänk om i flaskan allt var slut \n när det vankas sill och potäter. \n Om nån gjort kupp. \n Och rensat upp. \n Ja, allt blitt torrlagt av terrorgrupp. \n Tur att vi faktiskt får en sup till \n midsommarsillen vi äter!",
            "songMelody": "Hej Tomtegubbar"
        ],
        [
            "songTitle": "Midsommar",
            "songLyric": "Samla er go´vänner nu är midsommar´n här \n Kul ni kunde komma och nu ska vi skåla. \n Sommaren vi firar, den ju är oss så kär. \n \n Vi äter nypotatis och sillen är ju med. \n Ja, låt oss alla festa tills mörkret fallit ned! \n Och se så många flaskor vi redan korkat upp på bordet: \n Skåne och Aalborg och OP - det är ju sed!",
            "songMelody": "Sjösala vals"
        ],
        [
            "songTitle": "Midsommarsup",
            "songLyric": "Midsommarsupen den är rätt \n HURRA, HURRA \n Den sätter på humöret sprätt \n HURRA, HURRA \n Till potatis, dill o´en sillabit \n vi höjer glasen i denna rit, \n Ja, nu så tar vi en liten aquavit. \n \n Ja, sommarn hälsar vi så här \n HURRA, HURRA \n för lätta kläder nu vi bär \n HURRA, HURRA \n Och vi är glada och sjunger en bit \n för varma sommarn som kommit hit. \n Ja, nu så tar vi vår lilla aquavit!",
            "songMelody": "When Johnny comes marching home"
        ],
        [
            "songTitle": "Starka Snapsar",
            "songLyric": "Vi vill ha starka snapsar till vår sill – mamma. \n Nåt annat vill vi inte ha. \n Vi älskar Svart Vinbärs och Skåne och en Herrgård. \n och vodkan den med lingonsmak. \n Bäsk – gör oss så sälla. \n Pors – gör oss så snälla. \n Reymersholms är härligt läbbigt. \n \n Vi vill ha starka snapsar till vår sill – mamma. \n Nåt annat vill vi inte ha! \n Badabidibabba. \n Nåt annat vill vi inte ha. \n Badabidibabba. \n Nåt annat vill vi i-inte haaaaaaa!!!",
            "songMelody": "Blommig falukorv"
        ],
        [
            "songTitle": "Sommar och snaps",
            "songLyric": "När majstången stå där med blommor o blad \n och Sjöblom han tar sig ett nakenbad, \n ja, då är sommar´n här. \n Och snapstid det är",
            "songMelody": "När gäddorna leker..."
        ],
        [
            "songTitle": "Säg det med ett leende",
            "songLyric": "Säg det med ett leende \n och höj nu nubben i ditt glas. \n Ett härligt, glatt beteende \n här på vårt midsommarkalas. \n Till nypotatis och god sill \n det smakar bra med nubbe till. \n Ja, säg det med ett leende \n och ta sen nubben i ditt glas: \n SKÅL!",
            "songMelody": "Säg det med ett leende"
        ],
        [
            "songTitle": "Den badstrandstid nu kommer",
            "songLyric": "Den badstrandstid nu kommer, \n när magen är för stor. \n Då hela kroppen sväller, \n och celluliter gror. \n Och alla våra valkar, \n lyfts fram i solens ljus. \n Nej stranden verkar boring, \n vi stannar inomhus. \n \n De krav som sommarn ställer, \n förstör vår ledighet. \n Vi sitter där och gnäller, \n fy fan vad jag e´ fet. \n Fast vem vill motionera, \n när man kan sitta still. \n Nej låt oss revoltera, \n vi tar en nubbe till!",
            "songMelody": "Den blomstertid nu kommer"
        ],
        [
            "songTitle": "Fira med nubbe",
            "songLyric": "Midsommar firar vi med nubbe, \n liten nubbe, liten nubbe \n Midsommar firar vi med nubbe, \n liten nubbe, liten nubbe. \n Ja' me' och du me', \n ja' me' och du me'!",
            "songMelody": "Morsgrisar är vi allihopa"
        ],
        [
            "songTitle": "Fira med nubbe 2",
            "songLyric": "Midsommar firar vi med nubbe, \n mycket sill och nypotatis \n Midsommar firar vi med nubbe, \n mera nubbe. och mera nubbe. \n Ja' me' och du me', \n ja' me' och du me'!",
            "songMelody": "Morsgrisar är vi allihopa"
        ],
        [
            "songTitle": "Nu midsommarnubben",
            "songLyric": "Nu midsommarnubben ska du allt på stubben, ner i våra halsar rinna. \n Nu midsommarnubben ska du allt på stubben, ner i våra halsar rinna. \n Än slank den hit, och än slank den dit, men den hittar inte strupen. \n Än slank den hit, och än slank den dit, och nu slank den ner i strupen.",
            "songMelody": "Prästens lilla kråka"
        ],
        [
            "songTitle": "Skål på dig, berlusconi",
            "songLyric": "Berlusconi, per favor' \n behåll din skinka, vi har vår! \n Med grappa, pasta, pestosås, \n får andra smörja sina krås. \n Vi vill ha midsommar-sill \n och förstås en sup därtill!",
            "songMelody": "Blinka lilla stjärna där "
        ],
        [
            "songTitle": "Dubbelnubbe",
            "songLyric": "Hujedamej, så god den är, \n ej bättre tänkas kan. \n Och nubbe är det namn den bär \n (Nubben tages) \n den ner för strupen rann. \n \n Singdudeldej, singdudeldej \n singdudeldudeldej \n Singdudeldej, singdudeldej... \n (Nubben tages ånyo) \n \n Midsommarsuptjohej!",
            "songMelody": "Linas Emilvisa"
        ],
        [
            "songTitle": "När nubben kom på borden",
            "songLyric": "När nubben kom på borden \n då blev det vår och göken gol \n och ögonen de lyste \n av vårgrönt och av sol. \n \n När nubben kom i magen \n bröt sommarn ut i fuller blom. \n Och det blev bara värre \n tills flaskan den var tom.",
            "songMelody": "När Lillan kom till jorden"
        ],
        [
            "songTitle": "Styrkedroppar",
            "songLyric": "Du ska inte tro det är Renat \n och OP i denna karaff! \n Nej, dropparna kommer ur någonting \n vars innehav innebär straff! \n \n Och peppar det kör jag i brygden, \n det döljer att finkeln är rå, \n och andra små roliga smaker \n som passar till sill och Pripps blå. \n \n Och magen har roliga ställen \n där spriten kan fara omkring \n tills alla är fulla och gla-a-da \n och bena förmår ingenting!",
            "songMelody": "Idas somarvisa"
        ],
        [
            "songTitle": "Upp och ner",
            "songLyric": "Upp och ner, snapsen far, \n sången ljuder hög och klar. \n Ta en till, med lite sill \n och potatis om du vill. \n Snapsen rinner, strupen brinner. \n Åh, vad det är skönt!",
            "songMelody": "Upp och ner"
        ],
        [
            "songTitle": "Aquavit i glasen",
            "songLyric": "Aquavit det häller vi i glasen, vi i glasen. \n Glada blir vi utav bara fasen, bara fasen. \n Kul det är när alla är i gasen, är i gasen \n Det är bra på midsommarkalasen, på kalasen \n Skvätt, Skvätt Skvätt Skvätt Skvättevätteskvättskvätt \n Skvätt Skvätt Skvätt",
            "songMelody": "Midnatt råder"
        ],
        [
            "songTitle": "Punkatröst",
            "songLyric": "Midsommar, midsommar, cykla bak och fram \n ett, två, tre så sa det pang! \n Jäkla cykelslang! \n SKÅL!",
            "songMelody": "Bjällerklang"
        ],
        [
            "songTitle": "Lille sup, lille sup",
            "songLyric": "Lille sup, lille sup, \n lille söte supen \n nu ska du, nu ska du, \n ner igenom strupen",
            "songMelody": "Lille Katt"
        ],
        [
            "songTitle": "1 2 75 6 7",
            "songLyric": "1 2 75 6 7 75 6 7 75 6 7 \n 1 2 75 6 7 75 6 7 73 \n 107 103 102 107 6 19 47 \n 17 18 16 15 13 19 14 17 \n 19 16 15 11 9 47 - HEJ!",
            "songMelody": "Ritsch, ratsch, filibom"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
        ],
        [
            "songTitle": "TITEL",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "MELODI"
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
        //cell.textLabel?.textColor = UIColor.white
        //cell.backgroundColor = UIColor.blue
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
