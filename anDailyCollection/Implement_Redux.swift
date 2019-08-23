//
//  Implement_Redux.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/23/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct AppState: State {
    var message:String = "Hello"
    var listOfMetars:[XML.Accessor] = []
}

let store = Store(reducer: appReducer, state: nil)

struct getMetarAction:Action{
    let station_id:String
}

struct addToMetarList:Action{
    let metars:[XML.Accessor]
}
func appReducer(_ action:Action,_ state: State?)->State {
    
    var newState = state as? AppState ?? AppState()
    switch action {
    case let action as getMetarAction:
        newState.message = "metar redux state"
        print(newState)
        print("metar redux")
    case let action as addToMetarList:
        action.metars.forEach {newState.listOfMetars.append($0)}
        print("added \(action.metars.count)")
       
    default:
        print("going redux default")
        break
    }
    return newState
}
