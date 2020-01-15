//
//  Card.swift
//  Solo
//
//  Created by Jae Cho on 12/24/19.
//  Copyright © 2019 Jae Cho. All rights reserved.
//

import Foundation

struct Card:Equatable{
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    private var identifier: Int
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int{
        self.identifierFactory += 1
        return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
    var isSet = false
    var isSelected = false
    
    var features = (NumShapes.none,Shape.none,Shading.none,CardColor.none)
}

enum NumShapes:Int{
    case none = 0
    case one = 1
    case two = 2
    case three = 3
    static var all = [NumShapes.none,NumShapes.one,NumShapes.two,NumShapes.three]
}

enum Shape:String{
    case none
    case diamond
    case squiggle
    case oval
    static var all = [Shape.none,Shape.diamond,Shape.squiggle,Shape.oval]
}

enum Shading:String{
    case none
    case solid
    case striped
    case open
    static var all = [Shading.none,Shading.solid,Shading.striped,Shading.open]
}

enum CardColor:String{
    case none
    case red
    case green
    case purple
    static var all = [CardColor.none,CardColor.red,CardColor.green,CardColor.purple]
}




