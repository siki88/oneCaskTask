//
//  OneCaskApp.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

#warning("TUDU: implement localization ?!")
#warning("v grafice nejsou popsane globalni nazvy barev")

#warning("TUDU: zmena na ImageResource")

#warning("navigace je basic, aby nebylo mozno pouzit testovaci projekt jako produkcni")

@main
struct OneCaskApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ViewRouter.shared)
                .environmentObject(GlobalConfigurations.shared)
                .environmentObject(InternetAvailability.shared)
        }
    }
}
