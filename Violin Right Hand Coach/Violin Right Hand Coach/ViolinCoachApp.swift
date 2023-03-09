//
//  ViolinCoachApp.swift
//  Violin Right Hand Coach
//
//  Created by Jack Young on 22/02/2023.
//  Copyright © 2023 Jack Young. All rights reserved.
//

import SwiftUI
import AppFeature

@main
struct ViolinCoachApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            AppView(store: self.appDelegate.store)
        }
        //        .onChange(of: self.scenePhase) {
        //            self.appDelegate.viewStore.send(.didChangeScenePhase($0))
        //        }
    }
}
 
