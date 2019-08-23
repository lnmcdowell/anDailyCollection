//
//  simpleRedux.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/23/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import Foundation

protocol Action {}

protocol State {}

typealias Reducer = (_ action: Action, _ state: State?) -> State

protocol StoreSubscriber {
    func newState(state: State)
}

public class Store {
    let reducer:Reducer
    var state: State?
    var subscribers: [StoreSubscriber] = []
    
    init(reducer: @escaping Reducer, state: State?){
        self.reducer = reducer
        self.state = state
    }

 func Dispatch(action: Action){
        state = reducer(action,state)
        
        subscribers.forEach {$0.newState(state: state!)}
    }
func subscribe(_ newSubscriber: StoreSubscriber){
            subscribers.append(newSubscriber)
        }
    }


