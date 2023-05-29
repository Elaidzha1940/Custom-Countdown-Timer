//  /*
//
//  Project: Custom Countdown Timer
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.05.2023
//
//  */

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ViewMoel()
    private let timer = Timer.publish(every: 1, on: .main, in:
            .common).autoconnect()
    private let width: Double = 250
    
    var body: some View {
        
        VStack {
            Text("\(vm.time)")
            
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
