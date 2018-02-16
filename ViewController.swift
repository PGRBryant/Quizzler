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
    var questionNumber: Int = 0 //track which question you're on... this should probably be in the questionBank, actually...
    var score: Int = 0 //taking care of "score" elements in ViewController is actually kinda bad
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestions.edit(size: allQuestions.list.count) //instead of the count, could have a "setting" page to handle this kind of information
        nextQuestion()
        updateUI()
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
        
        scoreLabel.text = "Score: \(score)"
//        progressLabel.text = "\(questionNumber)/\(allQuestions.length)"
        
//        progressBar.frame.size.width = (view.frame.size.width / allQuestions.length) * CGFloat(questionNumber + 1)
        
      
    }
    

    //handle the "end of quiz" situation here
    func nextQuestion() {
        //next question logic
        
        //if we're done with the quiz, then...
        let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle:. alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
        { (UIAlertAction) in
            self.startOver()
        })
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    //here we should update the score, including if we want to restart the score on each repeat
    func checkAnswer() {
//        if correctAnswer == pickedAnswer
        
    }
    
    
    //Want to add the question of "How long should I make the quiz?"
    func startOver() {
        
       
    }
    
}
