//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class ViewController: UIViewController,AVAudioPlayerDelegate {
    var ref:DatabaseReference!//1 to read
    var dataBaseHandle:DatabaseHandle!//3 to read
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var counter = 0
    var score = 0
    let soundName = ["winner","no","start"]
    var player : AVAudioPlayer!
    var index : Int = 2
    let ALERTMESSAGE = "You\'ve already finished all the questions, do you want to start over the GAME?"
    let ALERTTITLE = "Congrats"
    let ALERTACTIONMESSAGE = "Restart"
    var posData = [Question]()
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(soundName: soundName[index])
        
        //////////////////////////////////////
        
//                SET FIREBASE REFERENCE
        ref = Database.database().reference()//2 to read
        dataBaseHandle = ref?.child("QuestionBank").observe(.value, with: { (snapshot) in
            guard let data = snapshot.value as? [String:[String:Any]]  else{
                return
            }
            

            for(_,val) in data{
                
                 let newObj = Question(questionText:val["Question"] as! String, correctAnswer:val["correctAnswer"] as! Bool)
                 self.posData.append(newObj)
                print(val["Question"] as! String,"\n")
                print(val["correctAnswer"] as! Bool,"\n")
            }


        })
     
      
      ////////////////////////////////////
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
        if counter < posData.count - 1{
            
            //////////////////////////////////////////////////////////
            let question = posData[counter].questionText
            questionLabel.text = question
            updateUI()
        }
        else{//CREATE AN ALERT
            let alert = UIAlertController(title: ALERTTITLE, message: ALERTMESSAGE, preferredStyle: .alert)

            let restartAction = UIAlertAction(title: ALERTACTIONMESSAGE, style: .default) { (UIAlertAction) in
                self.startOver()
            }

            alert.addAction(restartAction)

            //PRESENT ALERT TO THE VIEWER
            present(alert, animated: true,completion: nil)

        }

    }

    
    
    func checkAnswer() {
        let answer = posData[counter]
        if answer.correctAnswer == pickedAnswer{
            index = 0
            ProgressHUD.showSuccess("Correct!")
            score += 1
        }
        else {
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
        index = 2
        playSound(soundName: soundName[index])
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
