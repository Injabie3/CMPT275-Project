//
//  Question.swift
//  PPal
//
//  Created by rclui on 11/9/17.
//  Copyright © 2017 CMPT275. All rights reserved.
//

import Foundation

/**
 An encapsulating class that defines a question for the quiz portion
 of our application.
 */
class Question {
    
    init() {
        id = -1
        choices = [Choice]()
        choices.reserveCapacity(4)
        correctAnswer = -1
        selectedAnswer = -1
    }
    
    /// The database primary key, used to store this question
    private var id: Int
    
    /// An array to hold the four possible choices for each question.
    private var choices: [Choice]
    
    /// Index to the correct answer of the array of choices.
    private var correctAnswer: Int
    
    /// Index to the selected answer of the array of choices.  This is set by the user when they are playing the quiz.
    private var selectedAnswer: Int
    
    
    /**
     Determines if the Question is valid.
     Must contain:
     - 4 valid questions.
     - A correct answer
     */
    var valid: Bool {
        get {
            for choice in choices {
                if !choice.valid {
                    return false
                }
            }
            return choices.count == 4 && correctAnswer != -1
        }
    }
    
    /**
     Sets the correct answer in the array.
     - parameter index: The index corresponding to the correct Choice in the choices array stored by the class.
     - returns: true or false.
         - True if the correct answer index was set successfully.
         - False if the index supplied was invalid, and nothing is set.
     */
    func set(correctAnswerIndex index: Int) -> Bool {
        if index < 0 || index > 3 {
            return false
        }
        else {
            correctAnswer = index
            return true
        }
    }
    
    /**
     Sets the selected answer in the array.  This is to indicate which answer the user
     selected during the quiz.
     - parameter index: The index corresponding to the selected Choice
         in the choices array stored by the class.
     - returns: true or false.
         - True if the correct answer index was set successfully.
         - False if the index supplied was invalid, and nothing is set.
     */
    func set(selectedAnswerIndex index: Int) -> Bool {
        if index < 0 || index > 3 {
            return false
        }
        else {
            selectedAnswer = index
            return true
        }
    }
    
    /**
     Sets the provided choice at the provided index of the choice array.
     - parameter choice: The choice to add to the question.
     - parameter atIndex: The index you want to add this question at.
     - returns: true or false.
         - True if the choice was set correctly.
         - False if the choice was not set.  This is due to the Choice being invalid, or the index supplied is out of bounds.
     */
    func set(choice: Choice, atIndex: Int) -> Bool {
        if !choice.valid || atIndex < 0 || atIndex > 3 {
            return false
        }
        else {
            choices[atIndex] = choice
            return true
        }
    }
    
    /**
     Returns the index to the correct choice/answer.
     - returns: An index to the correct answer.  Use this index to access the correct element of the getChoices() method.
     */
    func getCorrectAnswer() -> Int {
        return correctAnswer
    }
    
    /**
     Gets the array of choices for the question.
     - returns: An array of Choice(s)
     */
    func getChoices() -> [Choice] {
        return choices
    }
    
}