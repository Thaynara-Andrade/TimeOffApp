//
//  MenuActivities.swift
//  TimeOffApp
//
//  Created by Robson Lima Lopes on 11/06/22.
//

import Foundation

struct Activities{
    static var myActivities: [Activity] = []
    
    static func addActivity(_ activity: Activity){
        self.myActivities.append(activity)
    }
    
    static func sortActivities(){
        if !myActivities.isEmpty{
            self.myActivities.sort{ $0.time < $1.time }
        }
        
    }
    
    static func getRandomActivity() -> Activity{
        if let randomElement = self.myActivities.randomElement() {
            return randomElement
        }else{
            return Activity(name: "", time: 0, duration: 0)
        }
    }
    
}

struct Activity{
    let name: String
    let time: Double
    let duration: Int
}
