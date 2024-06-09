//
//  InternetAvailability.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import Foundation
import Network

enum InternetAvailabilityType {
    case connection
    case disconnection
}

class InternetAvailability: ObservableObject {
    
    @Published var internetAvailabilityType: InternetAvailabilityType = .connection
    
    static var shared = InternetAvailability()
    
    init() {
        let monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.internetAvailabilityType = .connection
            } else {
                self.internetAvailabilityType = .disconnection
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}
