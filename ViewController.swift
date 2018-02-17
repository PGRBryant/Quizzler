//
//  ViewController.swift
//  Quizzler
//
//  Created by Gabriel Bryant on 2/15/18.
//  Copyright © 2018 Phaeroh All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var allQuestions: QuestionBank = QuestionBank()
    var pickedAnswer : Bool = false //need to give it an initial value
    var currentQuestion: Question = Question(text: "Welcome to the Quiz app!", correctAnswer: false)//track which question you're on... this should probably be in the questionBank, actually...
    var numQuestionsInBank: Int = 7 //Initial value, s/b changeable whenever
    var score: Int = 0 //taking care of "score" elements in ViewController is actually kinda bad
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestions.edit(size: numQuestionsInBank) //could have a "setting" page to handle this kind of information
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 { //this means they pressed True
            pickedAnswer = true
        } else if sender.tag == 2 { //only one other tag, for now? 
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    //this should be called to update the score, the question, whatevs.
    func updateUI() {
        questionLabel.text = currentQuestion.questionText
        scoreLabel.text = "Score: \(score)"
        let currentQuestionNum = numQuestionsInBank - allQuestions.list.count
        progressLabel.text = "\(currentQuestionNum)/\(numQuestionsInBank)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(numQuestionsInBank)) * CGFloat(currentQuestionNum)
    }
    

    //handle the "end of quiz" situation here
    func nextQuestion() {
        //next question logic
        if allQuestions.list.count > 0 {
            self.currentQuestion = allQuestions.list.popLast()!
            updateUI()
        } else {
            //if we're done with the quiz, then...
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle:.alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
    }
    
    
    //here we should update the score, including if we want to restart the score on each repeat
    func checkAnswer() {
        if currentQuestion.answer == pickedAnswer {
            score = score + 1
        }
        nextQuestion()
    }
    
    
    //Want to add the question of "How long should I make the quiz?"
    func startOver() {
        score = 0
        allQuestions = QuestionBank() //init a new one -- lazy, but this way it rebuilds each time
        let alert = UIAlertController(title: "New Quiz", message: "How long would you like to make your next quiz? (Up to 30 questions!)", preferredStyle: .alert)
        
        //add an inputtable text field
        alert.addTextField { (textField) in
            textField.placeholder = "7"
            textField.keyboardType = .numberPad
            textField.textAlignment = .right
        }
        
        let goAction = UIAlertAction(title: "Go", style: .default) { (_) in
            if let field = alert.textFields?[0] {
//                UserDefaults.standard.set(field.text, forKey: "numQuestions")
//                UserDefaults.standard.synchronize()
                if let num = Int(field.text!) {
                    self.numQuestionsInBank = num
                    if num > self.allQuestions.maxNumQuestions { //should handle max size somehow
                        self.numQuestionsInBank = self.allQuestions.maxNumQuestions
                    }
                } else {
                    self.numQuestionsInBank = 7
                }
                self.allQuestions.edit(size: self.numQuestionsInBank)
                self.nextQuestion()
            } else {
                //user did not fill field
            }
        }
        
        //Do I want a cancel option?
        //let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alert.addAction(goAction)
        //alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}
