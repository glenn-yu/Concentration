//
//  Concentration.swift
//  Concentration
//
//  Created by YUGWANGYONG on 19/09/2018.
//  Copyright © 2018 Gwang Y. All rights reserved.
//

import Foundation

// class -> struct Lecture 4
struct Concentration
{
    // Array<Card>() -> [Card]() :: 배열
    private(set) var cards = [Card]()
    
    // computed properties(연산 프로퍼티) getter, setter
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            // Lecture 4. Closures
//            let ch = "h".oneAndOnly
            return cards.indices.filter { cards[$0].isFaceUp}.oneAndOnly
//            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    // Lecture 4. 구조체 Mutating
    // 구조체의 매서드가 구조체 내부에서 데이터 수정 할떄는 Mutating키워드를 선언 해주어야함
    // 따라서 다른 구조체 API를 보고 Mutating이 있느냐 없느냐에 따라서, 원래 구조체 내부의값을 변경 하는 API 인지, 아닌지 유추할수 있습니다.
    mutating func chooseCard(at index: Int)
    {
        // 실행을 기대하지 않는 코드 경로에 assert를 배치하는 것은 논리적인 문제를 찾아내고 오류를 빠르게 없앨 수 있는 훌륭한 방법입니다.
        // 디버깅모드에서만 동작. 오류 검증을 위하여 사용.
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                // check if cards match
                if cards[matchIndex] == cards[index]
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


// Lecture 4. Closures, Protocol
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
