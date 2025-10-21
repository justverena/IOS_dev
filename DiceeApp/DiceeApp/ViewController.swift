//
//  ViewController.swift
//  DiceeApp
//
//  Created by Verena Gaaze on 18.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    let diceImages = [
        UIImage(named: "Dice1"),
        UIImage(named: "Dice2"),
        UIImage(named: "Dice3"),
        UIImage(named: "Dice4"),
        UIImage(named: "Dice5"),
        UIImage(named: "Dice6")
    ].compactMap { $0 }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftDiceImageView.image = diceImages[0]
        rightDiceImageView.image = diceImages[0]
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        leftDiceImageView.image = diceImages.randomElement()
        rightDiceImageView.image = diceImages.randomElement()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            leftDiceImageView.image = diceImages.randomElement() ?? diceImages[0]
            rightDiceImageView.image = diceImages.randomElement() ?? diceImages[0]
        }
    }
}
