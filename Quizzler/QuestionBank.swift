//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Marlon Escobar on 2019-04-09.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank{
    var list = [Question]()
    init(){
        list.append(Question(questionText: "Valentine\'s day is banned in Saudi Arabia.", correctAnswer: true))
        
        list.append(Question(questionText: "A slug\'s blood is green.", correctAnswer: true))
        
        list.append(Question(questionText: "Approximately one quarter of human bones are in the feet.", correctAnswer: true))
        
        list.append(Question(questionText: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: true))
        
        list.append(Question(questionText: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: true))
        
        list.append(Question(questionText: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false))
        
        list.append(Question(questionText: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true))
        
        list.append(Question(questionText: "You can lead a cow down stairs but not up stairs.", correctAnswer: false))
        
        list.append(Question(questionText: "Google was originally called \"Backrub\".", correctAnswer: true))
        
        list.append(Question(questionText: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))
        
        list.append(Question(questionText: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))
        
        list.append(Question(questionText: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))
        
        list.append(Question(questionText: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true))
    }
}
