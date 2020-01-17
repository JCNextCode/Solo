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
            game.chooseCard(at: cardNumber)
        }
        
    }
    
    private func updateViewFromModel(){
        for index in setCardButton.indices{
            let cardButton = setCardButton[index]
            let card = game.inDisplayCards[index]

        }
    }
    
    private var cardCharacters = ["","▲", "●", "■"]
    
    private func setCardDisplay(for card:Card) ->String{
        var cardString = cardCharacters[card.features.0.hashValue]
        var tempCardString = ""
        for _ in 1...card.features.0.hashValue{
            tempCardString += cardString
        }
        cardString = tempCardString

        return cardString
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
