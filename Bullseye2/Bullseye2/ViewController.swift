//
//  ViewController.swift
//  Bullseye2
//
//  Created by Murat Merekov on 14.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var roundCount = 0{
        didSet{
            round.text = "\(roundCount)"
        }
    }
    var point = 0
  var currentValue = 0
    var sumOfScore = 0
    @IBOutlet weak var aimGenerator: UILabel!
    
    var rand = 0;
    
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var round: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rand = Int.random(in: 1...100)
        aimGenerator.text = "\(rand)"
    }


    @IBAction func showAlert(_ sender: Any) {
        var htitle: String
        let msg: String
        if currentValue == rand{
            htitle = "Perfect! You hit \(currentValue)"
            point = 100
            
        }
        else if abs(rand - currentValue)<=5{
            htitle = "Good! You hit \(currentValue)"
            point = 60
        }else if abs(rand-currentValue)<=10{
            htitle = "Bad! You hit \(currentValue)"
            point = 30
        }
        else{
            htitle = "You are blind! You hit \(currentValue)"
            point = 0
        }
        
        msg = "You get \(point) point!"
        
        let alert = UIAlertController(title: htitle, message: msg, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Continue", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        let roundedValue = sender.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
  func startNewRound(){
    roundCount += 1
    sumOfScore += point
    score.text = "\(sumOfScore)"
    
        rand = Int.random(in: 1...100)
        currentValue = 50
        
        aimGenerator.text = "\(rand)"
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        score.text = "0"
        round.text = "0"
        sumOfScore = 0
        roundCount = 0
        startNewRound()
    }
    
}

