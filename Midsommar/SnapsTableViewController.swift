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
            "songLyric": "Helan går, \n sjung hopp falleri faderallan lej, \n helan går, \n sjung hopp faderallan lej \n Och den som inte helan tar \n han inte heller halvan får \n Helan gåååååååår \n sjung hopp faderallan lej!",
            "songMelody": "Helan går"
        ],
        [
            "songTitle": "Den badstrandstid nu kommer",
            "songLyric": "Den badstrandstid nu kommer, \n när magen är för stor. \n Då hela kroppen sväller, \n och celluliter gror. \n Och alla våra valkar, \n lyfts fram i solens ljus. \n Nej stranden verkar boring, \n vi stannar inomhus. \n \n De krav som sommarn ställer, \n förstör vår ledighet. \n Vi sitter där och gnäller, \n fy fan vad jag e´ fet. \n Fast vem vill motionera, \n när man kan sitta still. \n Nej låt oss revoltera, \n vi tar en nubbe till!",
            "songMelody": "Den blomstertid nu kommer"
        ],
        [
            "songTitle": "Thank you for the brännvin",
            "songLyric": "Thank you for the brännvin \n that keeps us singing, \n thanks for all the joy it´s bringing, \n who could live without it, \n ask in all honesty? \n What would life be? \n Without a snaps and a skål, what are we ? \n So I say: thank you for the brännvin \n for bringing it to me",
            "songMelody": "Thank you for the music"
        ],
        [
            "songTitle": "Idas Facebook-visa",
            "songLyric": "Du ska inte tro att jag glömmer bort \n de bilder vi plåtar ikväll. \n Jag kommer att ladda upp varje kort \n och vill inte höra nått gnäll. \n \n De hamnar på Facebook helt indiskret \n ja, även om du säger nej. \n Du har ingen rätt att förbjuda det \n för du har gjort samma mot mig.",
            "songMelody": "Idas Sommarvisa"
        ],
        [
            "songTitle": "Instakräftan",
            "songLyric": "Dags för kräftor, glöm inte att plåta. \n Ut på Insta för att fiska likes. \n Välj ett filter, tagga alla vänner, \n visa flödet att du har det nice. \n \n Men en liten dålig sak \n gällande vår hjärtesak \n är att under filter-spak \n mat kan tappa smak. \n \n Tur att kräftor då ska vara kalla, \n och vår kompis snapsen likaså!",
            "songMelody": "Bamse"
        ],
        [
            "songTitle": "Autocorrect",
            "songLyric": "Vem kan skriva ett sms \n efter sju-åtta snapsar. \n Utan autocorrects effekt \n som gör att allt kollapsar. \n \n Jag kan skida fett sms \n efter sju-klocka snacksar. \n Utan automobilskonfekt \n jag dör på katt och paxar.",
            "songMelody": "Vem kan segla"
        ],
        [
            "songTitle": "Snapchat",
            "songLyric": "Jag sände en snap en gång, \n och tiden var inte lång, \n men någon hann ändå skärmdumpa bilden på mig. \n \n Svara mig du, \n vad gör jag nu? \n \n Jag var inte naken, \n men fruktansvärt ful.",
            "songMelody": "Jag hade en gång en båt"
        ],
        [
            "songTitle": "Vi ska festa",
            "songLyric": "Vi ska dricka, vi ska festa, \n vi ska göra vårat bästa, \n vi ska låta marken gunga, \n vi äro ännu unga. \n Vi dansar uppå borden, \n vi festar in Norden \n Och vi ska bara dricka, sjunga, \n spexa, älska, vara unga.\n för vi har det jättefestligt nu!",
            "songMelody": "Mössen i Askungen"
        ],
        [
            "songTitle": "Var nöjd med allt vad livet ger",
            "songLyric": "Var nöjd med, allt vad livet ger \n och allting som du kring dig ser, \n glöm bort bekymmer, sorger och besvär! \n Var glad och nöjd, för vet du vad, \n en björntjänst gör ju ingen glad, \n var nöjd med livet som vi lever här!",
            "songMelody": "Var nöjd med allt vad livet ger"
        ],
        [
            "songTitle": "Sån är spriten",
            "songLyric": "Sån är spriten, sån är spriten \n Så mycket brännvin finns det här \n Den sup man ratar, den tar nån annan \n Så ta nu snapsen som du har kär.",
            "songMelody": "Sånt är livet"
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
            "songTitle": "Festen kan börja",
            "songLyric": "Festen kan börja \n ingen får sörja \n när det finns både \n brännvin och mat \n Helan ska tömmas \n sorgerna glömmas \n ingen får vara \n tråkig kamrat \n \n Klappa mitt hjärta \n fröjdas min själ \n nubben serveras genast, nåväl! \n \n Nu tar vi supen \n öppna på strupen \n gästernas välkomstskål! \n SKÅL!",
            "songMelody": "Vårvindar friska"
        ],
        [
            "songTitle": "Till nubben tager man",
            "songLyric": "Till nubben så tager man sill, fallera, \n men också ansjovis, om man vill, fallera. \n Men om man är oviss, \n och sillen är ansjovis, \n så tager man bara några nubbar till, fallera. \n SKÅL!",
            "songMelody": "Vi går över daggstänkta berg"
        ],
        [
            "songTitle": "En Liten gull",
            "songLyric": "En Liten gull \n en liten gull… \n en liten gull… \n en liten gull… \n en liten gull, en gull \n en gull, en gull \n en-gull-en-gull-en-gull \n en-gull-en \n gullviva, mandelblom, katfot och blå viol. \n SKÅL!",
            "songMelody": "En Liten gull"
        ],
        [
            "songTitle": "Magen brummar…",
            "songLyric": "Magen brummar \n Jag försummar \n Hälla dit \n mera sprit \n Nu så skall vi dricka \n Så att vi får hicka \n Mera sprit \n Akvavit \n SKÅL!",
            "songMelody": "Broder Jacob"
        ],
        [
            "songTitle": "Surret",
            "songLyric": "Vad är det för jädrans surr, \n pip, pip. \n Jag känner mig lite snurr, \n pip, pip. \n Jag viskar till frugan: \n Ser du också flugan? \n Nej, jag ser en geting jag, \n pip, pip. \n SKÅL!",
            "songMelody": "Här kommer Karl-Alfred boy"
        ],
        [
            "songTitle": "Min lilla kråksång",
            "songLyric": "När älgarna klappar takten \n till min lilla kråksång, \n när älgarna klappar takten \n blir den alldeles för lå-å-ång. \n \n Och när myggorna klappar takten \n till min lilla kråksång, \n när myggorna klappar takten \n blir den alldeles för kort. \n \n Men när kråkorna klappar takten, \n till min lilla kråksång, \n när kråkorna klappar takten, \n så blir den lagom lång. \n SKÅL!",
            "songMelody": "Min lilla kråksång"
        ],
        [
            "songTitle": "En kulen natt",
            "songLyric": "En kulen natt, natt, natt \n min båt jag styrde \n på havets vågade, vågade våg \n så skummet yrde. \n Och vart jag sågade, sågade, såg \n på havets vågade, vågade, våg \n långt ner i djupetti, petti, pe \n en fisk jag såg, och det var duuuuu \n SKÅL!",
            "songMelody": "En kulen natt"
        ],
        [
            "songTitle": "Yesterday",
            "songLyric": "RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n \n RADBYTE \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD \n RAD",
            "songMelody": "Yesterday"
        ],
        [
            "songTitle": "Sommarvisa",
            "songLyric": "Du ska inte tro du får somna \n när spriten har satt lite fart \n Om armar och ben börjar domna \n så danser du samba så klart. \n \n Och när jag har fångat dej \n i min famn \n så släpper jag inte mitt grepp. \n Jag älskar dej, fast jag har glömt \n ditt namn \n jag håller dej till du skriker Släpp",
            "songMelody": "Idas sommarvisa"
        ],
        [
            "songTitle": "Visa mot aftonen",
            "songLyric": "Så länge rösten är mild \n så länge ingen är vild \n så länge spegeln på väggen \n ger halvskaplig bild \n så länge alla kan stå \n så länge alla kan gå \n så länge alla kan tralla \n så fyller vi på! \n SKÅL!",
            "songMelody": "Så länge skutan kan gå"
        ],
        [
            "songTitle": "Sillfest",
            "songLyric": "Höj nu glasen all gäster här, \n sillfest, sillfest hela da´n. \n midsommar det har vi nu igen, \n sillfest, sillfest hela da´n. \n Goda nubbar blir det här idag, \n sillfest, sillfest hela da´n. \n De går som smort, \n det har det alltid gjort, \n Ja, midsommar är allt en härlig dag. \n SKÅL!",
            "songMelody": "Vi e alla glada bagarbarn"
        ],
        [
            "songTitle": "Lilla glömskan",
            "songLyric": "Sill, potatis, raj di daj di dukat bord, \n iskall snaps ta daj da glömt visst alla ord \n Hm ta Helan \n raj ta Halvan \n midsommar, tralallala, \n måste sjunga först för att få snapsen ta.",
            "songMelody": "Imbelupet glaset står"
        ],
        [
            "songTitle": "Dubbelnubbe",
            "songLyric": "Hujedamej, så god den är, \n ej bättre tänkas kan. \n Och nubbe är det namn den bär \n (Nubben tages) \n den ner för strupen rann. \n \n Singdudeldej, singdudeldej \n singdudeldudeldej \n Singdudeldej, singdudeldej. \n (Nubben tages ånyo) \n Midsommarsuptjohej!",
            "songMelody": "Hujedamej"
        ],
        [
            "songTitle": "Kors va det sneglas",
            "songLyric": "Kors vad det sneglas på snapsar i dag! \n Är det snapssnegling? \n Nä, dom ska drickas! \n Skål!",
            "songMelody": "Dans på Brännö brygga"
        ],
        [
            "songTitle": "I sommarsolen",
            "songLyric": "I sommarens värmande strålar \n vi sitter och äter och skålar. \n Det kostar oss rätt mycket stålar \n vi sjunger så ändå: Hallå, hallå! \n Du som är smal du som är skral \n du som om skallen din är kal. \n Du som är le´, du som är sne´ \n ja, allihopa sjunger me´. \n I sommarens värmande strålar \n så glada sjunga vi: Slå i, slå i!",
            "songMelody": "I sommarens soliga dagar"
        ],
        [
            "songTitle": "Midsommarnubben",
            "songLyric": "Alla här sitta, fånigt och titta. \n Nubbarna glittra kalla som is. \n Ja, varför dröja? Nej, låt oss höja \n glasen med klang på fädernas vis. \n \n Nubben den gör att alla bra mår. \n Sillen den manar: Skål och gutår! \n Solen den lyser, nubben den fryser. \n Värm den i magen, bra du då mår.",
            "songMelody": "Vårvindar friska"
        ],
        [
            "songTitle": "Uti vår mage",
            "songLyric": "Uti vår mage där \n växa begär \n kom hjärtans kär. \n Vill du mig något \n så träffas vi där. \n Kom kryddsill och kall potatis, \n kom brännvin och quantum satis, kom \n allt som kan drickas, \n kom hjärtans fröjd.",
            "songMelody": "Uti vår mage"
        ],
        [
            "songTitle": "När gäddorna leka",
            "songLyric": "När gäddorna leka i vikar och vass och \n sola går ner bakom Sjöbloms dass. \n Ja, då är det vår. \n Ja, då är det vår.",
            "songMelody": "När gäddorna leker"
        ],
        [
            "songTitle": "Kär snaps har många namn",
            "songLyric": "Jag är getingen, färdknäppen, \n orren och göken. \n Jag är tutingen, rackaren, \n järnet och kröken. \n Knappen innanför västen är jag. \n \n Jag är klämtaren, luringen, \n nubben och fjutten. \n Jag är jamaren, rövaren, \n supen och hutten.",
            "songMelody": "Det var dans bort i vägen"
        ],
        [
            "songTitle": "Försvårad ankring",
            "songLyric": "Med åror kan man komma långt \n med segel kan man komma längre \n men med en flaska brännvin, \n smör ost och sill, \n kommer man så långt man vill, \n men det blir svårt att lägga till.",
            "songMelody": "Med käckhet kan man komma långt"
        ]
    ]
    
    // När man klickar på sök-symbolen ska sökfältet och tangentbordet visas
    @IBAction func searchButton(_ sender: Any) {
        present(searchController, animated: true, completion: nil)
        searchController.searchBar.becomeFirstResponder()
    }
    
    // När man klickar på random-symbolen så ska en slumpad snapsvisa dyka upp
    @IBAction func randomSnapsvisa(_ sender: Any) {
        songTitles.shuffle()
        tableView.reloadData()
    }
    
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
            searchResult = songTitles.filter({$0.lowercased().contains(text)})
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
        cell.titleText.text = array[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSnapsSegue" {
             if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! SnapsViewController
                if shouldUseSearchResult {
                    destVC.titleText = searchResult[indexPath.row]
                } else {
                    destVC.titleText = songTitles[indexPath.row]
                    destVC.lyricText = songLyrics[indexPath.row]
                    destVC.melodyText = "Melodi: " + songMelodies[indexPath.row]
                }
            }
        }
    }
    
}

extension Array {
    mutating func shuffle() {
        for _ in 0..<10 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
