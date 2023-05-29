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
        
        ZStack {
            Color.brown.opacity(0.7)
            VStack {
                
                VStack(alignment: .leading) {
                    Button {
                        //action
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    .frame(width: 75, height: 60)
                    .background(Color.black).opacity(0.4)
                    .cornerRadius(20)
                    .offset(x: -190, y: -190)
                    .padding()
                }
                
                Text("\(vm.time)")
                    .font(.system(size: 70, weight: .medium, design: .rounded))
                    .frame(width: width)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.brown, lineWidth: 4))
                    .alert("Timer is over!", isPresented: $vm.showingAlert) {
                        Button("Continue", role: .cancel) {
                            //code
                        }
                    }
                
                Slider(value: $vm.minutes, in: 1...10, step: 1)
                    .padding()
                    .frame(width: width)
                    .disabled(vm.isActive)
                    .animation(.easeOut, value: vm.minutes)
                    .background(Color.black).opacity(0.4)
                    .cornerRadius(20)

                
                HStack(spacing: 50) {
                    Button("Start") {
                        vm.start(minutes: vm.minutes)
                    }
                    .disabled(vm.isActive)
                    .tint(.white)
                    
                    Button("Reset", action: vm.reset)
                        .tint(.black)
                }
                .frame(width: width)
                
            }
            .accentColor(.black)
            .onReceive(timer) { _ in
                vm.updateCountdown()
            }
        }
        .background(Color.black)
        .ignoresSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
