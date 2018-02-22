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
        list.append(Question(text: "Valentine\'s day is banned in Saudi Arabia.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "A slug\'s blood is green.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "Approximately one quarter of human bones are in the feet.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "It is illegal to pee in the Ocean in Portugal.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "Google was originally called \"Backrub\".", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces can be enough to kill a very small dog.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "Pakistan and India are neighboring countries.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "The 2004 Olympic Games were hosted by Greece.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "The tallest mountain, from its base to its peak, is Mauna Kea.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "Earthworms breathe through their skin.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "An eagle's nest is called an eyrie.", answers: ["True", "False"], correctAnswer: "True"))
        list.append(Question(text: "Walt Disney's middle name was Elias.", answers: ["True", "False"], correctAnswer: "True"))
        //15
        list.append(Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "You can lead a cow down stairs but not up stairs.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "The human heart will have beat at most 1 million times by the age of 60 years.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Sound travels much slower through water than through air.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Napoleon was much shorter than the average French soldier of his time.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Salty water boils quicker than regular water.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Dropping a penny from the top of the Empire State Building could easily kill someone.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "The Great Wall of China is visible from space.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Goldfish can only remember the last three seconds.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Most Viking helmets had horns.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Bagpipes were invented in Scotland.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Holding a toad will give you warts.", answers: ["True", "False"], correctAnswer: "False"))
        list.append(Question(text: "Original Ninjas of history only wore black.", answers: ["True", "False"], correctAnswer: "False"))
        //30
        list.append(Question(text: "Which is the largest planet in the solar system?", answers: ["Jupiter", "Neptune", "Earth", "Mars"], correctAnswer: "Jupiter"))
        list.append(Question(text: "How many Presidents have there been in the USA?", answers: ["36", "29", "45", "51"], correctAnswer: "45"))
        list.append(Question(text: "What color is closest to 'cerulean'?", answers: ["Red", "Blue", "Yellow", "Green"], correctAnswer: "Blue"))
        list.append(Question(text: "What is a group of dolphins called?", answers: ["School", "Herd", "Pod", "Pool"], correctAnswer: "Pod"))
        list.append(Question(text: "Who invented penicillin?", answers: ["Alexandra Fleming", "Thomas Edison", "Marie Curie", "George Orwell"], correctAnswer: "Alexandra Fleming"))
        list.append(Question(text: "On what date was President John F Kennedy assassinated?", answers: ["November 22 1962", "November 22 1963", "October 22 1963", "October 22 1964"], correctAnswer: "November 22 1963"))
        list.append(Question(text: "How many men have walked on the moon?", answers: ["10", "5", "12", "9"], correctAnswer: "12"))
        list.append(Question(text: "Who has won the most Academy Awards?", answers: ["James Cameron", "Walt Disney", "Katherine Hepburn", "Steven Spielberg"], correctAnswer: "Walt Disney"))
        list.append(Question(text: "What is the currency of Brazil?", answers: ["Dollar", "Yen", "Real", "Krona"], correctAnswer: "Real"))
        list.append(Question(text: "Bronze is an alloy consisting of two or more metals. What are they?", answers: ["Copper and Zinc", "Silver and Gold", "Copper and Lead", "Copper and Tin"], correctAnswer: "Copper and Tin"))
        list.append(Question(text: "What is the first element of the periodic table?", answers: ["Sodium", "Oxygen", "Nitrogen", "Hydrogen"], correctAnswer: "Hydrogen"))
        list.append(Question(text: "What type of electrical charge does a neutron have?", answers: ["Negative", "Positive", "No charge"], correctAnswer: "No charge"))
        list.append(Question(text: "Air is mostly made up of which element?", answers: ["Nitrogen", "Carbon", "Argon", "Oxygen"], correctAnswer: "Nitrogen"))
        list.append(Question(text: "What body of water encompasses the majority of Greek Islands?", answers: ["Red Sea", "Caspian Sea", "Aegean Sea", "Black Sea"], correctAnswer: "Aegean Sea"))
        list.append(Question(text: "Which desert dominates a large area of Northern Africa?", answers: ["Kalahari", "Gobi", "Mojave", "Sahara"], correctAnswer: "Sahara"))
        //45
    }
    
    func edit(size: Int) {
        list.shuffle() //shuffle the order everytime, totally inefficient
        
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
