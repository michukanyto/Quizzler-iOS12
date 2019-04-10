//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var counter = 0
    var score = 0
    let soundName = ["winner","no"]
    var player : AVAudioPlayer!
    var index : Int!
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else{
            pickedAnswer = false
        }
        counter += 1
        checkAnswer()
  
    }
    
    
    func updateUI() {
        progressLabel.text = String("\(counter + 1)/13")
        scoreLabel.text = "Score : \(String(score))"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat (counter + 1) //CALCULATE THE PROGRESS BAR
      
    }
    

    func nextQuestion() {
        if counter < allQuestions.list.count - 1{
            let question = allQuestions.list[counter]
            questionLabel.text = question.questionText
            updateUI()
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
            index = 0
            ProgressHUD.showSuccess("Correct!")
            score += 1
        }
        else {
            print("Wrong!")
            index = 1
            ProgressHUD.showError("Wrong!")
        }
        playSound(soundName: soundName[index])
        nextQuestion()
    }
    
    
    func startOver() {
        print ("New Game!")
        score = 0
        counter = 0
        nextQuestion()
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")!
        do
        {
            player = try AVAudioPlayer(contentsOf: url)
            
        }
        catch
        {
            print(error)
        }
        player.play()
    }
}
