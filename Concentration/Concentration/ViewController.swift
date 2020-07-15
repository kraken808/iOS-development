//
//  ViewController.swift
//  Concentration
//
//  Created by Murat Merekov on 06.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
   
    var numberOfPairsOfCards: Int{
        return cardButtons.count / 2
    }
    
    private(set) var flipCount = 0{
        didSet{
            flipCountLable.text = "Flips: \(flipCount)"
        }
    }
    private var emojiChoices = ["🦋","🐯","😡","😎","🦑","🦉","🐳","🐵","🐸","🐢"]
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLable: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("error")
        }
        
    }
    
   private func updateViewFromModel(){
        for index in 0..<cardButtons.count{
            let button  = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for:UIControl.State.normal)
                           button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emoji = [Card:String]()
    
  private  func emoji(for card: Card) -> String{
        if emojiChoices.count>0{
        if emoji[card] == nil{
            
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            }
        }
        return emoji[card] ?? "?"
    }
    
}

extension Int{
    var arc4random: Int{
        if self>0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self<0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}
