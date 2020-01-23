//
//  SetLogic.swift
//  Solo
//
//  Created by Jae Cho on 12/24/19.
//  Copyright © 2019 Jae Cho. All rights reserved.
//

import Foundation

let DISPLAYABLE_SIZE = 24
let CURRENT_SELECTED_SIZE = 3
let FULL_DECK_SIZE = 81

struct SetLogic{

    private(set) var inDisplayCards = [Card]()
    private(set) var setCompletedCards = [Card]()
    private(set) var currentSelectedCards = [Card]()
    private(set) var fullDeck = [Card]()
    
    var selectionCount = 0
    
    
    init(numberOfCards: Int){
        //I am a genius for thinking this up.
        for SelectedNum in NumShapes.all{
            for selectedShape in Shape.all{
                for selectedShading in Shading.all{
                    for selectedColor in CardColor.all{
                        var card = Card()
                        card.features.self = (SelectedNum,selectedShape,selectedShading,selectedColor)
                        fullDeck += [card]
                    }
                }
            }
        }
        shuffleCards()
        print(fullDeck[0])
        
        //display only the initial cards
        for displayItem in 0..<DISPLAYABLE_SIZE{
            inDisplayCards += [fullDeck.remove(at: displayItem)]
        }
    }
    
    mutating private func shuffleCards(){
        for shuffleCandidate in fullDeck.indices{
            let randomIndex = Int(arc4random_uniform(UInt32(fullDeck.count)))
            fullDeck.swapAt(shuffleCandidate, randomIndex)
        }
    }
    mutating func chooseCard(at index: Int){
        //let's protect the API method with assertion
        assert(inDisplayCards.indices.contains(index),"SetLogic.chooseCard(at \(index) : index not in cards")
        //if
    }
}
