//
//  Recipe_ViewerApp.swift
//  Recipe Viewer
//
//  Created by jae Lee on 8/20/24.
//

import SwiftUI

@main
struct Recipe_ViewerApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeContentView()
                .navigationBarTitle("Dessert Recipes")
                
            }
            
        }
    }
}
