//
//  NavigationAppApp.swift
//  NavigationApp
//
//  Created by Mirza Učanbarlić on 24. 2. 2024..
//

import SwiftUI
import SwiftData

@main
struct NavigationAppApp: App {
    let router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
        }
    }
}
