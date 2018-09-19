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
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
//    @IBOutlet var cardButtons: Array<UIButton>!

    var emojiChoices = ["🎃", "👻", "👻", "🎃"]
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print("cardNumber : \(cardNumber)")
        }
        else
        {
            print("chosen card was not in cardButtons")
        }
//        flipCard(withEmoji: "👻", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton)
    {
        print("flipCard :: \(emoji)")
        
        if button.currentTitle == emoji
        {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else
        {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

