//
//  ContentView.swift
//  BullseyePractice
//
//  Created by 박지홍 on 2019/12/18.
//  Copyright © 2019 Jihong Park. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to :")
                Text("100")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 0...100)
                Text("100")
            }
            Spacer()
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello, there!"), message: Text("The slider value is \(self.sliderValue)"), dismissButton: .default(Text("Awesome!")))
            }
            
            Spacer()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                    
                }
                Spacer()
                Text("Score: ")
                Text("9999")
                Spacer()
                Text("Round: ")
                Text("1")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                    
                }
            }
            .padding(.bottom, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
