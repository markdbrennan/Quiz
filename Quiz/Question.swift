//
//  Question.swift
//  Quiz
//
//  Created by Mark Brennan on 19/03/2016.
//  Copyright © 2016 Mark Brennan. All rights reserved.
//

import UIKit

class Question: NSObject {
    var questionText:String = ""
    var answers:[String] = [String]()
    var correctAnswerIndex:Int = 0
    var module:Int = 0
    var lesson:Int = 0
    var feedback:String = ""
}
