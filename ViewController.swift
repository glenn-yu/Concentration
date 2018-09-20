//
//  ViewController.swift
//  Concentration
//
//  Created by YUGWANGYONG on 18/09/2018.
//  Copyright © 2018 Gwang Y. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    /**
        access control - Study..
     */
    // access control
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)

    // computed properties(연산 프로퍼티) getter, setter
    // Read Only 는 get 만 있어도 된다.
    var numberOfPairsOfCards: Int {
        return (cardButtons.count+1) / 2
    }
    
    // access control
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
//    @IBOutlet var cardButtons: Array<UIButton>!
    
    @IBAction private func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
//            print("cardNumber : \(cardNumber)")
        }
        else
        {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp
            {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
//    var emoji = Dictionary<Int, String>()
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String
    {
        if emoji[card.identifier] == nil, emojiChoices.count > 0
        {
//            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
//            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

/*
    확장은 기존 클래스, 구조체 또는 열거형 타입에 새로운 기능을 추가한다.
    기존 소스 코드에서 접근하지 못하는 타입들을 확장하는 능력이다(소급 적용 모델링).
    확장은 Objective-C의 카테고리와 유사하다(Swift 확장은 이름을 가지지 않는다는 점에서 Objective-C 카테고리와는 다르다.).
 */
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
