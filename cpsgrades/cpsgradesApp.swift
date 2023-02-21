 //
//  cpsgradesApp.swift
//  cpsgrades
//
//  Created by Michelle Tang on 2/19/23.
//

import SwiftUI

@main
struct cpsgradesApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
