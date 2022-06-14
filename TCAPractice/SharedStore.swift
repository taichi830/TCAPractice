//
//  SharedStore.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/14.
//

import ComposableArchitecture

struct SharedState: Equatable {
    var countersState = CountersState()
    var currentTab = Tab.counter
    
    enum Tab {
        case counter
        case profile
    }
    
    struct ProfileState: Equatable {
        private(set) var count = 0
        private(set) var currentTab: Tab
        
        fileprivate mutating func resetCount() {
            self.count = 0
            self.currentTab = .counter
        }
    }
    
    var profile: ProfileState {
        get {
            ProfileState(
                count: self.countersState.counter01.count,
                currentTab: self.currentTab
            )
        }
        set {
            self.countersState.counter01.count = newValue.count
            self.currentTab = newValue.currentTab
        }
    }
    
    enum SharedStateAction: Equatable {
    }
    
}
