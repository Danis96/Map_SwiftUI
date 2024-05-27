//
//  SwiftUI_MapApp.swift
//  SwiftUI_Map
//
//  Created by Danis Preldzic on 27. 5. 2024..
//

import SwiftUI

@main
struct SwiftUI_MapApp: App {
    
    @StateObject var lvm: LocationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(lvm)
        }
    }
}
