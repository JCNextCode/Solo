//
//  ViewController.swift
//  Solo
//
//  Created by Jae Cho on 12/23/19.
//  Copyright © 2019 Jae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = SetLogic(numberOfCards: numberOfCardsOnDeck)
    
    var numberOfCardsOnDeck: Int{
        return setCardButton.count
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var setCardButton: [UIButton]!
    
    @IBAction func dealMoreCardsButton(_ sender: UIButton) {
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = setCardButton.firstIndex(of: sender){
            print("\(cardNumber)")
        }
        
    }
}

extension Int{
    var arc4random: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0{
            return -Int(arc4random_uniform(UInt32(self)))
        }else {
            return 0
        }
    }
}
