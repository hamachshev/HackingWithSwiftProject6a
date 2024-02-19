//
//  ViewController.swift
//  Project2
//
//  Created by Aharon Seidman on 1/6/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries.append(contentsOf: ["estonia", "france", "germany", "ireland","italy", "monaco","nigeria","poland", "russia", "spain","uk", "us"])
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(_ alert:UIAlertAction! = nil){
        questionsAsked += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + "-- Your score is \(score)"
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String {
            if sender.tag == correctAnswer {
                score += 1
                return "Correct"
            } else {
                score -= 1
                return "Wrong (you chose \(countries[sender.tag]))"
            }
        }
        
        let ac1 = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac1.addAction(UIAlertAction(title: "Continue", style: .default, handler: {[weak self] _ in
            
            if self?.questionsAsked == 10 {
                let ac = UIAlertController(title: "Keep it going!!", message: "youve done 10 in a row", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "continue", style: .default, handler: self?.askQuestion))
                self?.present(ac, animated: true)
            } else  {
                self?.askQuestion()
            }
            
        }))
        present(ac1, animated: true)
        
    }
    
}
