//
//  ViewController.swift
//  Quizzler
//
//  Created by Gabriel Bryant on 2/15/18.
//  Copyright © 2018 Phaeroh All rights reserved.
//

import UIKit
//import Cocoa

class ViewController: UIViewController {
    
    var allQuestions: QuestionBank?
    var pickedAnswer : String = "" //need to give it an initial value
    var currentQuestion: Question? //track which question you're on... this should probably be in the questionBank, actually...
    var numQuestionsInBank: Int = 5 //Initial value, s/b changeable whenever
    var score: Int = 0 //taking care of "score" elements in ViewController is actually kinda bad
    var maxScore: Int = 0
    
    //victory particles
//    var rootLayer = CALayer()
    var fireworkEmitter = CAEmitterLayer()
    let particleEmitter = CAEmitterLayer()

    @IBOutlet var mainView: UIView!
    
    //fun score modifiers
    var streakLength: Int = 0
    var streakMultiplier: Int = 5
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    //Question Buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet var buttons: [UIButton]! //whole collection
    
    //in order to fix the awkwardly misshappen progressBar on first load, have to force its initial size like this-->
    override func viewWillLayoutSubviews() {
        let currentQuestionNum = numQuestionsInBank - allQuestions!.list.count
        if progressBar.frame.size.width == CGFloat(24) && currentQuestionNum < 2 {
            progressBar.frame.size.width = view.frame.size.width * CGFloat (1.0 / Double(numQuestionsInBank))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allQuestions = QuestionBank()
        allQuestions!.edit(size: numQuestionsInBank)
        setMaxScore()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if let buttonTitle = sender.title(for: .normal) {
            pickedAnswer = buttonTitle
        }
        
        checkAnswer()
    }
    
    //this should be called to update the score, the question, whatevs.
    func updateUI() {
        questionLabel.text = currentQuestion!.questionText
        scoreLabel.text = "Score: \(score)"
        
        let currentQuestionNum = numQuestionsInBank - allQuestions!.list.count
        progressLabel.text = "\(currentQuestionNum)/\(numQuestionsInBank)"
        
        let ratio = CGFloat(Double(currentQuestionNum) / Double(numQuestionsInBank))
        progressBar.frame.size.width = view.frame.size.width * ratio
        
        //first show all buttons with correct title, then hide the rest of the buttons
        if let answers = currentQuestion!.answers {
            for index in 0..<answers.count {
                buttons[index].setTitle(answers[index], for: .normal)
                buttons[index].alpha = 1
            }
            
            for index in answers.count..<buttons.count {
                buttons[index].alpha = 0
            }
        }
    }
    

    //handle the "end of quiz" situation here
    func nextQuestion() {
        //next question logic
        if allQuestions!.list.count > 0 {
            self.currentQuestion = allQuestions!.list.popLast()!
            updateUI()
        } else {
            //if we're done with the quiz, then...
            self.currentQuestion = Question(text: "", answers: [], correctAnswer: "")
            var alertTitle = ""
            var alertMsg = ""
            if didGetMaxPossibleScore() {
                self.createFireworks()
                alertTitle = "AMAZING!!"
                alertMsg = "You've finished all the questions! And got a PERFECT score of \(score)! Enjoy the fireworks!"
            }
            else {
                self.createParticles()
                alertTitle = "Great Job!"
                alertMsg = "You've finished all the questions! You got a score of \(score)!"
            }
            
            let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle:.alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            updateUI()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //here we should update the score, including if we want to restart the score on each repeat
    func checkAnswer() {
        if currentQuestion!.correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            score = score + 1 + streakLength*streakMultiplier
            print(score)
            streakLength = streakLength + 1
        } else {
            ProgressHUD.showError("Wrong")
            streakLength = 0
        }
        nextQuestion()
    }
    
    
    //Want to add the question of "How long should I make the quiz?"
    func startOver() {
        if didGetMaxPossibleScore() { fireworkEmitter.removeFromSuperlayer() }
        else { particleEmitter.removeFromSuperlayer() }
        
        score = 0
        streakLength = 0
        allQuestions = QuestionBank() //init a new one -- lazy, but this way it rebuilds each time
        self.allQuestions!.edit(size: self.numQuestionsInBank)
        self.nextQuestion()
        
//        setMaxScore() //just in case we ever change size

        /* Commenting this out since it doesn't provide a nice user experience
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
         */ //end user experience removal
    }
    
    //MARK -- Particle Stuff for Victory Animations
    func setMaxScore() {
        var maxScore = 0
        var tempStreak = 0
        
        for _ in 1...numQuestionsInBank {
            maxScore = maxScore + 1 + tempStreak*streakMultiplier
            tempStreak = tempStreak + 1
        }
        
        self.maxScore = maxScore
        
        print(maxScore)
    }
    
    func didGetMaxPossibleScore() -> Bool {
        return (score >= maxScore)
    }
    
    
    //particle stuff
    func createParticles() {
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = kCAEmitterLayerLine
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let red = makeEmitterCell(color: UIColor.red)
        let green = makeEmitterCell(color: UIColor.green)
        let blue = makeEmitterCell(color: UIColor.blue)
        
        particleEmitter.emitterCells = [red, green, blue]
        
        view.layer.addSublayer(particleEmitter)
    }
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scaleRange = 0.5
        cell.scaleSpeed = -0.05
        
        cell.contents = UIImage(named: "particle")?.cgImage
        return cell
    }
    
    //Firework stuff
    func createFireworks() {
        //would like to give it a little "gray over" screen in the background too
        //        self.rootLayer.bounds = self.mainView.bounds
        //        let color = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        //        rootLayer.backgroundColor = color
        
        let image = UIImage(named: "particle")?.cgImage
        
        fireworkEmitter.emitterPosition = CGPoint(x: self.view.bounds.size.width/2,
                                                  y: self.view.bounds.size.height)
        fireworkEmitter.renderMode = kCAEmitterLayerAdditive
        
        let emitCel = makeEmitterCellsForFireworks()
        emitCel.emitterCells = [makeFlareCellForFirworks(img: image!),
                                makeFireworkCellForFireworks(img: image!)]
        fireworkEmitter.emitterCells = [emitCel]
        
        view.layer.addSublayer(fireworkEmitter)
    }
    
    func makeEmitterCellsForFireworks() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        emitterCell.emissionLongitude = CGFloat(Double.pi / 2)
        emitterCell.emissionLatitude = 0
        emitterCell.lifetime = 2.6
        emitterCell.birthRate = 6
        emitterCell.velocity = -550
        emitterCell.velocityRange = 100
        emitterCell.yAcceleration = 150
        emitterCell.emissionRange = CGFloat(Double.pi / 6.0)
        let newColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        emitterCell.color = newColor
        
        emitterCell.redRange = 0.9
        emitterCell.greenRange = 0.9
        emitterCell.blueRange = 0.9
        emitterCell.name = "base"
        
        return emitterCell
    }
    
    func makeFlareCellForFirworks(img: CGImage) -> CAEmitterCell {
        let flareCell =  CAEmitterCell()
        flareCell.contents = img
        flareCell.emissionLongitude = CGFloat(2.0 * Double.pi)
        flareCell.scale = 0.4
        flareCell.velocity = -80
        flareCell.birthRate = 45
        flareCell.lifetime = 0.5
        flareCell.yAcceleration = 350
        flareCell.emissionRange = CGFloat(Double.pi / 7)
        flareCell.alphaSpeed = -0.7
        flareCell.scaleSpeed = -0.1
        flareCell.scaleRange = 0.1
        flareCell.beginTime = 0.01
        flareCell.duration = 1.7
        
        return flareCell
    }
    
    func makeFireworkCellForFireworks(img: CGImage) -> CAEmitterCell {
        let fireworkCell = CAEmitterCell()
        
        fireworkCell.contents = img
        fireworkCell.birthRate = 19999
        fireworkCell.scale = 0.6
        fireworkCell.velocity = -130
        fireworkCell.lifetime = 100
        fireworkCell.alphaSpeed = -0.2
        fireworkCell.yAcceleration = 80
        fireworkCell.beginTime = 1.5
        fireworkCell.duration = 0.1
        fireworkCell.emissionRange = 2 * CGFloat.pi
        fireworkCell.scaleSpeed = -0.1
        fireworkCell.spin = 2
        
        return fireworkCell
    }
}
