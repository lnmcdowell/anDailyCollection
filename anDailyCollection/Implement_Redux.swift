//
//  Implement_Redux.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/23/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct Station: Equatable {
    static func == (lhs: Station, rhs: Station) -> Bool {
        return lhs.name == rhs.name
    }
    
    var listOfMetars:[XML.Accessor] = []
    var name:String?
}

struct AppState: State {
    var message:String = "Hello"
    var listOfMetars:[XML.Accessor] = []
    

    var listOfStations:[Station] = []
    var currentScreen:UIViewController?
    var page:String="Start"
    var stationNames:[String]?
}

let store = Store(reducer: appReducer, state: nil)

struct getMetarAction:Action{
    let station_id:String
}

struct addToMetarList:Action{
    let metars:[XML.Accessor]
}

struct addStationsWithMetars:Action {
    let listOfStations:[Station]
}

struct navigationAction:Action{
    let currentScreen:UIViewController
    let nextScreen:UIViewController
}



func appReducer(_ action:Action,_ state: State?)->State {
    
    var newState = state as? AppState ?? AppState()
    switch action {
    case let action as getMetarAction:
        newState.message = "metar redux state"
        print(newState)
        print("metar redux")
        print(action)
    case let action as addToMetarList:
        action.metars.forEach {newState.listOfMetars.append($0)}
        print("added \(action.metars.count)")
    case let action as navigationAction:
        //this is not asyncronous, so I'm not dispatching to main queue
        action.currentScreen.navigationController?.pushViewController(action.nextScreen, animated: true)
        newState.currentScreen = action.nextScreen
        newState.page = type(of: action.nextScreen).description()
    case let action as addStationsWithMetars:
        action.listOfStations.forEach {
            //overwrite if previous list is present from same station, otherwise just add in
            if newState.listOfStations.contains($0){
                print("overwriting")
                let i = newState.listOfStations.firstIndex(of: $0)
                newState.listOfStations.remove(at: i!)
                 newState.listOfStations.append($0)
            } else{
              
                newState.listOfStations.append($0)
            }
        }
    default:
        print("going redux default")
        break
    }
    return newState
}
