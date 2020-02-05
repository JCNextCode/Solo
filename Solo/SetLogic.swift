//
//  SetLogic.swift
//  Solo
//
//  Created by Jae Cho on 12/24/19.
//  Copyright © 2019 Jae Cho. All rights reserved.
//

import Foundation

let DISPLAYABLE_SIZE = 24
let INIT_DISPLAY_CARD_SIZE = 12
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
        
        //display only the initial cards
        for displayItem in 0..<INIT_DISPLAY_CARD_SIZE{
            inDisplayCards += [fullDeck.remove(at: displayItem)]
        }
    }
    
    mutating func isSet() -> Bool{
        var setNumShapes,setShape,setShading,setColor : Bool
        //either 0 same or all 3 has to be the same.
        //maybe i can use recursionhere
        if currentSelectedCards.count == CURRENT_SELECTED_SIZE{
            if (currentSelectedCards[0].features.0.rawValue == currentSelectedCards[1].features.0.rawValue) && (currentSelectedCards[0].features.0.rawValue == currentSelectedCards[2].features.0.rawValue){
                setNumShapes = true
            }else if (currentSelectedCards[0].features.0.rawValue != currentSelectedCards[2].features.0.rawValue) && (currentSelectedCards[1].features.0.rawValue != currentSelectedCards[2].features.0.rawValue){
                setNumShapes = true
            }else{
                setNumShapes = false
            }
            if (currentSelectedCards[0].features.1.rawValue == currentSelectedCards[1].features.1.rawValue) && (currentSelectedCards[0].features.1.rawValue == currentSelectedCards[2].features.1.rawValue){
                setShape = true
            }else if (currentSelectedCards[0].features.1.rawValue != currentSelectedCards[2].features.1.rawValue) && (currentSelectedCards[1].features.1.rawValue != currentSelectedCards[2].features.1.rawValue){
                setShape = true
            }else{
                setShape = false
            }
            if (currentSelectedCards[0].features.2.rawValue == currentSelectedCards[1].features.2.rawValue) && (currentSelectedCards[0].features.2.rawValue == currentSelectedCards[2].features.2.rawValue){
                setShading = true
            }else if (currentSelectedCards[0].features.2.rawValue != currentSelectedCards[2].features.2.rawValue) && (currentSelectedCards[1].features.2.rawValue != currentSelectedCards[2].features.2.rawValue){
                setShading = true
            }else{
                setShading = false
            }
            if (currentSelectedCards[0].features.3.rawValue == currentSelectedCards[1].features.3.rawValue) && (currentSelectedCards[0].features.3.rawValue == currentSelectedCards[2].features.3.rawValue){
                setColor = true
            }else if (currentSelectedCards[0].features.3.rawValue != currentSelectedCards[2].features.3.rawValue) && (currentSelectedCards[1].features.3.rawValue != currentSelectedCards[2].features.3.rawValue){
                setColor = true
            }else{
                setColor = false
            }
            
            if setNumShapes && setShape && setShading && setColor{
                return true
            }
        }else{
            return false
        }
        return false
    }
    
    mutating func removeSetFromDisplay(){
        
        for removeIndex in currentSelectedCards.indices{
            for displayIndex in inDisplayCards.indices{
                if currentSelectedCards[removeIndex] == inDisplayCards[displayIndex]{
                    setCompletedCards += [currentSelectedCards[removeIndex]]
                    inDisplayCards.remove(at: displayIndex)
                    break
                    //inDisplayCards += [fullDeck.remove(at: 0)]
                }
            }
        }
    }
    
    mutating private func shuffleCards(){
        for shuffleCandidate in fullDeck.indices{
            let randomIndex = Int(arc4random_uniform(UInt32(fullDeck.count)))
            fullDeck.swapAt(shuffleCandidate, randomIndex)
        }
    }
    mutating func chooseCard(at index: Int) -> Bool{
        //let's protect the API method with assertion
        assert(inDisplayCards.indices.contains(index),"SetLogic.chooseCard(at \(index) : index not in cards")
        if currentSelectedCards.count < CURRENT_SELECTED_SIZE{
            currentSelectedCards += [inDisplayCards[index]]
            return false
        }else{
            if (isSet()){
                removeSetFromDisplay()
            }
            currentSelectedCards.removeAll()
            return true
            
        }
    }
    
    mutating func addCards(count no:Int){
        var index = 0
        while(inDisplayCards.count < DISPLAYABLE_SIZE && fullDeck.count > 0 && index < 3){
            inDisplayCards += [fullDeck.remove(at: 0)]
            index += 1
        }
    }
}
