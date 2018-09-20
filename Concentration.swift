//
//  Concentration.swift
//  Concentration
//
//  Created by YUGWANGYONG on 19/09/2018.
//  Copyright © 2018 Gwang Y. All rights reserved.
//

import Foundation

class Concentration
{
    // Array<Card>() -> [Card]() :: 배열
    private(set) var cards = [Card]()
    
    // computed properties(연산 프로퍼티) getter, setter
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int)
    {
        // 실행을 기대하지 않는 코드 경로에 assert를 배치하는 것은 논리적인 문제를 찾아내고 오류를 빠르게 없앨 수 있는 훌륭한 방법입니다.
        // 디버깅모드에서만 동작. 오류 검증을 위하여 사용.
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
            }
            else
            {
                // either no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int)
    {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have a least one pair of cards")
        for _ in 0..<numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
}
