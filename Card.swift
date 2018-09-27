//
//  Card.swift
//  Concentration
//
//  Created by YUGWANGYONG on 19/09/2018.
//  Copyright © 2018 Gwang Y. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
//    init(identifier: Int) {
//        self.identifier = identifier
//    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
