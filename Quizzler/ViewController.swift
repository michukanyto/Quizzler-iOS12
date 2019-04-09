//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var counter = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firtsQuestion = allQuestions.list[counter]
        questionLabel.text = firtsQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else{
            pickedAnswer = false
        }
        checkAnswer()
  
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if counter < allQuestions.list.count - 1{
            counter += 1
            let question = allQuestions.list[counter]
            questionLabel.text = question.questionText
        }
        else{//CREATE AN ALERT
            let alert = UIAlertController(title: "Congrats", message: "You've already finished all the questions, do you want to start over the GAME?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            
            //PRESENT ALERT TO THE VIEWER
            present(alert, animated: true,completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        let answer = allQuestions.list[counter]
        if answer.correctAnswer == pickedAnswer{
            print("you got it!")
        }
        else {
            print("Wrong!")
        }
        nextQuestion()
    }
    
    
    func startOver() {
        print ("New Game!")
        counter = 0
        viewDidLoad()
    }
    

}
