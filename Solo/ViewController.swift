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
        updateViewFromModel()
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet var setCardButton: [UIButton]!
    
    @IBAction func dealMoreCardsButton(_ sender: UIButton) {
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = setCardButton.firstIndex(of: sender){
            print("\(cardNumber)")
            //game.chooseCard(at: cardNumber)
            //setCardButton[cardNumber].setNeedsDisplay()
        }
        
    }
    
    private func updateViewFromModel(){
        for index in setCardButton.indices{
            let cardButton = setCardButton[index]
            let card = game.inDisplayCards[index]
            
            cardButton.layer.borderWidth = 3.0
            cardButton.layer.borderColor = UIColor.blue.cgColor
            cardButton.layer.backgroundColor = UIColor.white.cgColor
            cardButton.layer.cornerRadius = 8.0
            
            //cardButton.setTitle(setCardDisplay(for: card), for: UIControl.State.normal)
            cardButton.setAttributedTitle( setCardDisplay(for: card) , for: UIControl.State.normal)
        }
    }
    
    private var cardCharacterChoices = ["diamond":"▲","oval":"●","squiggle":"■"]
    //private var cardDesign = [Shape:String]()
    
    private func setCardDisplay(for card:Card) ->NSAttributedString{
        var cardString = cardCharacterChoices[card.features.1.rawValue]

        var tempCardString = ""
        for _ in 1...card.features.0.rawValue{
            tempCardString += cardString!
        }
        cardString = tempCardString

        var font = UIFont.preferredFont(forTextStyle: .body).withSize(20)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        var imageColor : UIColor
        var alphaComponent : UIColor
        
        switch card.features.3.rawValue {
        case "red":
            imageColor = UIColor.red
        case "green":
            imageColor = UIColor.green
        case "purple":
            imageColor = UIColor.purple
        default:
            imageColor = UIColor.white
        }
        
        switch card.features.2.rawValue {
        case "solid":
            alphaComponent = imageColor.withAlphaComponent(1.0)
        case "striped":
            alphaComponent = imageColor.withAlphaComponent(0.15)
        case "open":
            alphaComponent = imageColor.withAlphaComponent(0.0)
        default:
            alphaComponent = imageColor.withAlphaComponent(1.0)
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: alphaComponent,
            .paragraphStyle: paragraphStyle,
            .strokeWidth: -1,
            .strokeColor: imageColor
        ]
        let attributedCardString = NSAttributedString(string: cardString!, attributes: attributes)
        return attributedCardString
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
