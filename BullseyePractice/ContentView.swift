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
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to the my first app")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                Button(action: {
                    print("Button Pressed!")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                }
                .alert(isPresented: self.$alertIsVisible) {
                    Alert(title: Text("Hello, there!"), message: Text("This is my first popup."), dismissButton: .default(Text("Awesome!")))
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
