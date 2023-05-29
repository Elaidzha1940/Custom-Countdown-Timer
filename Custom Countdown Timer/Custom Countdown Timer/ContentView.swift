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
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .frame(width: width)
                .background(.thinMaterial)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 4))
                .alert("Timer done!", isPresented: $vm.showingAlert) {
                    Button("Continue", role: .cancel) {
                        //code
                    }
                }
            
            Slider(value: $vm.minutes, in: 1...10, step: 1)
                .padding()
                .frame(width: width)
                .disabled(vm.isActive)
            
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
