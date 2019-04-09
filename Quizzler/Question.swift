//
//  Question.swift
//  Quizzler
//
//  Created by Marlon Escobar on 2019-04-09.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    let questionText:String
    let correctAnswer:Bool
    init(questionText : String, correctAnswer : Bool){
        self.questionText = questionText
        self.correctAnswer = correctAnswer
    }
}
