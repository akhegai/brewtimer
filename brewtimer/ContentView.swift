//
//  ContentView.swift
//  brewtimer
//
//  Created by Andrei Khegai on 24/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopwatch = StopwatchManager(0.0)
    
    var body: some View {
        ZStack {
            Color("gray6")
                .edgesIgnoringSafeArea(.all)
            TabView {
                HoffmanTimerView()
                    .tabItem({
                        Text("H")
                        Text("Hoffman")
                        
                    })
                    .padding()
                FourToSixTimerView()
                    .tabItem({
                                Text("4:6")
                                Text("4:6")
                        
                    })
                    .padding()
            }
        }.preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
