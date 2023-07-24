//
//  ViewController.swift
//  QuizApp
//
//  Created by Abhishek Jadaun on 25/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    //    var quizQues = [
//        ["There are 29 states in India","True"],
//        ["Atomic number of lithium is 17","True"],
//        ["India is completed surrounded by water","False"]
//    ]
    
    //Alternate Way
    
    var quizQues = [
        Questions(text: "There are 29 states in India", answer: "True"),
        Questions(text: "Atomic number of lithium is 17", answer: "True"),
        Questions(text: "India is completely surrounded by water", answer: "False"),
        Questions(text: "Twenty nine + Forty two is Seventy one", answer: "True"),
        Questions(text: "One + Three is equal to Eight", answer: "False")
    ]
    
    var quesNum = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQues()
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        //check which option choosed by user
        let userAnswer = sender.currentTitle //true or false
        
        let correctAnswer = quizQues[quesNum].answer
        
        if userAnswer == correctAnswer{
            sender.backgroundColor = UIColor.green
            score += 1
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        if (quesNum < quizQues.count-1){
            quesNum += 1
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateQues), userInfo: nil, repeats: false)
    }
    
    @objc func updateQues(){
        questionText.text = quizQues[quesNum].text
            // so that buttton color changes to default when shifted to next quesion
        
        scoreText.text = "Score: \(score)"
    
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(quesNum+1) / Float(quizQues.count)
    }
    
}

