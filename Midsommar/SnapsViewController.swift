//
//  SnapsViewController.swift
//  Midsommar
//
//  Created by Hanna Östling on 2018-06-03.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {
    
    var titleText: String?
    var lyricText: String?
    var melodyText: String?

    @IBOutlet weak var snapsTitle: UILabel!
    @IBOutlet weak var snapsLyrics: UITextView!
    @IBOutlet weak var snapsMelody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let titleText = titleText {
            snapsTitle.text = titleText
        }
        if let lyricText = lyricText {
            snapsLyrics.text = lyricText
        }
        if let melodyText = melodyText {
            snapsMelody.text = melodyText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
