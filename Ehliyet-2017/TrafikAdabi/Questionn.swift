//
//  Question.swift
//  ornekbank
//
//  Created by YILMAZ ER on 7.04.2018.
//  Copyright © 2018 YILMAZ ER. All rights reserved.
//

import Foundation

class Questionn {
    
    let questionImage: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int
    
    init(image: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int) {
        questionImage = image
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        correctAnswer = answer
    }
}
