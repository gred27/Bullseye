//
//  ContentView.swift
//  BullseyePractice
//
//  Created by 박지홍 on 2019/12/18.
//  Copyright © 2019 Jihong Park. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in:1...100)
    @State var totalScore = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to :")
                Text("\(target)")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text(changeAlertTitle()), message: Text(
                    "The slider value is \(sliderValueRounded()).\n" +
                    "You scored \(pointForCurrentRound()) points its round."
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.totalScore = self.totalScore + self.pointForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            
            Spacer()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                    
                }
                Spacer()
                Text("Score: ")
                Text("\(totalScore)")
                Spacer()
                Text("Round: ")
                Text("\(round)")
                Spacer()
                Button(action: {self.startNewGame()} ) {
                    Text("Info")
                }
            }
            .padding(.bottom, 10)
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        }
        else {
            bonus = 0
        }
        
        return maximumScore - difference + bonus
    }
    
    func changeAlertTitle() -> String {
        let difference = amountOff()
        let alertTitle: String
        
        if difference == 0 {
            alertTitle = "Perfect!"
        } else if difference < 5 {
            alertTitle = "You almost had it!"
        } else if difference <= 10 {
            alertTitle = "Not bad.."
        } else {
            alertTitle = "Are you even trying?"
        }
        
        return alertTitle
    }
    
    func startNewGame() -> Void {
        sliderValue = 50.0
        target = Int.random(in:1...100)
        totalScore = 0
        round = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
