//
//  CTVC.swift
//  app4-Vanessa-Barnard
//
//  Created by Vanessa Barnard on 10/22/20.
//

import UIKit

class Instructions: UIViewController {
    
    @IBOutlet weak var txt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt.text = "Instructions:\n\nThis application is a demonstration of a Markov Chain on National Park Data.\n\n There are two options. You can train the model using National Park Names or National Park Descriptions. Click the button that cooresponds with your choice, then refresh the page to get access to a new prediction. Click on the prediciton to see the full text.\n\n Happy training!"
    }

}
