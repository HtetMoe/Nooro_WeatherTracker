//
//  ContentView.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
    
        NavigationView {
            WeatherView()
        }
    }
}

#Preview {
    ContentView()
}
