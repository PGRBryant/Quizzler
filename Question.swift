//
//  Question.swift
//  Quizzler
//
//  Created by Gabriel Bryant on 2/15/18.
//  Copyright © 2018 Phaeroh All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let correctAnswer : String
    let answers : [String]?
    //we could add a variable to track the number of times we answered this correctly, if we wanted
    //Or another variable with information ABOUT the question so we could store interesting tidbits
    
    init(text: String, answers: [String], correctAnswer: String) {
        questionText = text
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
}



/* Example of implementation

class myOtherClass {
    let question = Question(text: "What's the meaning of life?", correctAnswer: true)
    let question2 = Question(text: "How come the sky is blue?", correctAnswer: true)
}
 
 */
