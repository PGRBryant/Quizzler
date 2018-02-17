//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Gabriel Bryant on 2/15/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
    let maxNumQuestions = 30
    
    init() {
    
        //0
        list.append(Question(text: "Valentine\'s day is banned in Saudi Arabia.", correctAnswer: true))
        list.append(Question(text: "A slug\'s blood is green.", correctAnswer: true))
        list.append(Question(text: "Approximately one quarter of human bones are in the feet.", correctAnswer: true))
        list.append(Question(text: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: true))
        list.append(Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: true))
        list.append(Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false))
        list.append(Question(text: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true))
        list.append(Question(text: "You can lead a cow down stairs but not up stairs.", correctAnswer: false))
        list.append(Question(text: "Google was originally called \"Backrub\".", correctAnswer: true))
        list.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))
        //10
        list.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))
        list.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))
        list.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces can be enough to kill a very small dog.", correctAnswer: true))
        list.append(Question(text: "Pakistan and India are neighboring countries.", correctAnswer: true))
        list.append(Question(text: "The 2004 Olympic Games were hosted by Greence.", correctAnswer: true))
        list.append(Question(text: "The human heart will have beat at most 1 million times by the age of 60 years.", correctAnswer: false))
        list.append(Question(text: "Sound travels much slower through water than through air.", correctAnswer: false))
        list.append(Question(text: "Earthworms breathe through their skin.", correctAnswer: true))
        list.append(Question(text: "An eagle's nest is called an eyrie.", correctAnswer: true))
        list.append(Question(text: "Walt Disney's middle name was Elias.", correctAnswer: true))
        //20
        list.append(Question(text: "Napoleon was much shorter than the average French soldier of his time.", correctAnswer: false))
        list.append(Question(text: "Salty water boils quicker than regular water.", correctAnswer: false))
        list.append(Question(text: "Dropping a penny from the top of the Empire State Building could easily kill someone.", correctAnswer: false))
        list.append(Question(text: "The Great Wall of China is visible from space.", correctAnswer: false))
        list.append(Question(text: "Goldfish can only remember the last three seconds.", correctAnswer: false))
        list.append(Question(text: "Most Viking helmets had horns.", correctAnswer: false))
        list.append(Question(text: "Bagpipes were invented in Scotland.", correctAnswer: false))
        list.append(Question(text: "Holding a toad will give you warts.", correctAnswer: false))
        list.append(Question(text: "The tallest mountain, from its base to its peak, is actually Mauna Kea.", correctAnswer: true))
        list.append(Question(text: "Originals Ninjas of history only wore black.", correctAnswer: false))
        //30
    }
    
    func edit(size: Int) {
        list.shuffle() //shuffle the order everytime
        
        if list.count > size { //lazily handle any size inputted larger than max
            let numToRemove = list.count - size
            list.removeLast(numToRemove)
        }
    }
}

extension Array {
    mutating func shuffle() {
        for _ in indices {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
