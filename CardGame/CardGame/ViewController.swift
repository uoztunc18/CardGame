//
//  ViewController.swift
//  CardGame
//
//  Created by Umut Öztunç on 4.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLayer: UILabel!
    @IBOutlet weak var p1image: UIImageView!
    @IBOutlet weak var p2image: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    var deck : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startFromScratch()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func playGame(_ sender: Any) {
        print("Hello World")
        
        if deck.count < 2 {
            resultLayer.text = "Start the game"
            playButton.setTitle("Game ended", for: .disabled)
            playButton.isEnabled = false
            startFromScratch()
            return
        } else {
            playButton.setTitle("Play", for: .normal)
        }
        
        if let player1Card = drawCard()
        {
            p1image.image = UIImage.init(named: "card\(player1Card)")
            
            if let player2Card = drawCard() {
                p2image.image = UIImage.init(named: "card\(player2Card)")
                
                if player1Card > player2Card {
                    resultLayer.text = "Player 1 wins"
                } else {
                    resultLayer.text = "player 2 wins"
                }
            }
        }
    }
    
    func drawCard() -> Int? {
        return deck.popLast()
    }
    
    func startFromScratch() {
        deck.removeAll()
        
        for i in 1...13 {
            deck.append(i)
        }
        
        deck = deck.shuffled()
        p1image.image = UIImage.init(named: "back")
        p2image.image = UIImage.init(named: "back")
    }
}

