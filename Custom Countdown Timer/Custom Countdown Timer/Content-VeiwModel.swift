//  /*
//
//  Project: Custom Countdown Timer
//  File: Content-VeiwModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.05.2023
//
//
//  */

import Foundation

extension ContentView {
    final class ViewMoel: ObservableObject {
        
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var time: String = "5:00"
        @Published var minutes: Float = 5.0 {
            didSet {
                self.time = "\(Int(minutes)):00"
            }
        }
        
        private var initialTime = 0
        private var endDate = Date()
        
        func start(minutes: Float) {
            self.initialTime = Int(minutes)
            
        }
    }
}
