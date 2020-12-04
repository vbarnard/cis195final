//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit

class Single: UIViewController {
    
    var str : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt.text = str!
    }

    @IBOutlet weak var txt: UITextView!
}
