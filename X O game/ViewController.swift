//
//  ViewController.swift
//  X O game
//
//  Created by Awady on 7/5/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            
           if let button = view.viewWithTag(i) as? UIButton {
               button.setImage(nil, for: [])
            }
            
            winnerLabel.isHidden = true
            playAgainButton.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x , y: winnerLabel.center.y)
            playAgainButton.center = CGPoint(x: playAgainButton.center.x , y: playAgainButton.center.y)
        }
        
    }
    
    var activeGame = true
    var activePlayer = 1 // 1 for player x and 2 for player o
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 -> empty, 1 -> for x, 2 -> for o
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func Press(_ sender: AnyObject) {
        
        let activePosision = sender.tag - 1
      
        if gameState[activePosision] == 0 && activeGame {
            
            gameState[activePosision] = activePlayer
            
        
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "x.png"), for: [])
                activePlayer = 2
                
            }else {
                
                sender.setImage(UIImage(named: "o.png"), for: [])
                activePlayer = 1
            }
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[0]] == gameState[combination[2]] {
                    
                    activeGame = false
                     
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "'X' HAS WON!"
                    }else {
                        winnerLabel.text = "'O' HAS WON!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 50, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 50, y: self.playAgainButton.center.y)
                    })
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }
    

}

