//
//  Router.swift
//  NavigationApp
//
//  Created by Mirza Učanbarlić on 24. 2. 2024..
//
import SwiftUI

enum Screen: Identifiable, Hashable, CaseIterable {
    case one
    case two
    case three
    
    var id: String { String(describing: self) }
    
    var title: String {
        switch self {
        case .one:
            return "One"
        case .two:
            return "Two"
        case .three:
            return "Three"
        }
    }
}

@Observable
final class Router {
    var path = NavigationPath()
    
    init() {}
    
    func add(screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
}
