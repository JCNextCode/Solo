//
//  SetLogic.swift
//  Solo
//
//  Created by Jae Cho on 12/24/19.
//  Copyright © 2019 Jae Cho. All rights reserved.
//

import Foundation

struct SetLogic{
    
    private(set) var cards = [Card]()
    
    var selectionCount = 0
    
    
    init(numberOfCards: Int){
        for _ in 1...numberOfCards{
            let card = Card()
            cards += [card]
        }
    }
    mutating func chooseCard(at index: Int){
      
    }
}
