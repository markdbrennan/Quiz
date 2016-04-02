//
//  QuizModel.swift
//  Quiz
//
//  Created by Mark Brennan on 19/03/2016.
//  Copyright © 2016 Mark Brennan. All rights reserved.
//

import UIKit

class QuizModel: NSObject {
    
    // Method to get the questions from the JSON File
    func getQuestions() ->[Question] {
        
        // Array of question objects
        var questions:[Question] = [Question]()
        
        // Get JSON array of dictionaries
        let jsonObjects:[NSDictionary] = self.getRemoteJsonFile()
        
        // Loop through each dictionary and assign values to our question object
        var index:Int = 0
        
        while index < jsonObjects.count {
        //for index=0; index < jsonObjects.count; index += 1 {
    
            // Curent JSON dictionary
            let jsonDictionary:NSDictionary = jsonObjects[index]
            
            // Create a question object
            let q:Question = Question()
            
            // Assign the values of each key value pair to the question object
            q.questionText = jsonDictionary["question"] as! String
            q.answers = jsonDictionary["answers"] as! [String]
            q.correctAnswerIndex = jsonDictionary["correctIndex"] as! Int
            q.module = jsonDictionary["module"] as! Int
            q.lesson = jsonDictionary["lesson"] as! Int
            q.feedback = jsonDictionary["feedback"] as! String
            
            // Add the question to the questions array
            questions.append(q)
            
            index+=1
        }
        
        // Return list of question objects
        return questions
    }
    
    
    func getRemoteJsonFile() -> [NSDictionary] {
        
        // Create a new URL
        let remoteUrl:NSURL? = NSURL(string: "https://codewithchris.com/code/QuestionData.json")
        
        // Check if its nil
        if let actualRemoteUrl = remoteUrl {
            
            // Try to get the data
            let fileData:NSData? = NSData(contentsOfURL: actualRemoteUrl)
            
            // Check if its nil
            if let actualFileData = fileData {
                
                // Parse out the dictionaries
                do {
                    let arrayOfDictionaries:[NSDictionary] = try NSJSONSerialization.JSONObjectWithData(actualFileData, options: NSJSONReadingOptions.MutableContainers) as! [NSDictionary]
                    
                    return arrayOfDictionaries
                } catch {
                    // There was an error parsing the JSON file
                }
            }
        }
        return [NSDictionary]()
    }
    
    
    
    // OLD - REPLACED WITH REMOTE METHOD ABOVE
    func getLocalJsonFile() -> [NSDictionary] {
        
        // Get an NSURL object pointing to the JSON file in our app bundle
        let appBundlePath:String? = NSBundle.mainBundle().pathForResource("QuestionData", ofType: "json")
        
        // Use optional binding to check if path exists
        if let actualBundlePath = appBundlePath {
            // Path exists
            let urlPath:NSURL = NSURL(fileURLWithPath: actualBundlePath)
            let jsonData:NSData? = NSData(contentsOfURL: urlPath)
            
            if let actualJsonData = jsonData {
                // NSData exists - Parse the data and create the dictionaries
                do {
                    let arrayOfDictionaries:[NSDictionary] = try NSJSONSerialization.JSONObjectWithData(actualJsonData, options: NSJSONReadingOptions.MutableContainers) as! [NSDictionary]
                    
                    return arrayOfDictionaries
                } catch {
                    // There was an error parsing the JSON file
                }
            } else {
                // NSData does not exist
            }
        } else {
            // Path to JSON file in app bundle doesn't exist
        }
        // Return an empty array
        return [NSDictionary]()
    }
}