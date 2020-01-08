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
    
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0)
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font( Font.custom("ArialRoundedMTBold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font( Font.custom("ArialRoundedMTBold", size: 24))
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content:Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content:Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font( Font.custom("ArialRoundedMTBold", size: 18))
                
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content:Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font( Font.custom("ArialRoundedMTBold", size: 12))
                
        }
    }
    
    var body: some View {
        VStack {
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to :")
                    .modifier(LabelStyle())
                Text("\(target)")
                    .modifier(ValueStyle())
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                    .modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100")
                    .modifier(LabelStyle())
            }
            Spacer()
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
                .modifier(ButtonLargeTextStyle())
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
            .background(Image("Button")).modifier(Shadow())
            
            Spacer()
            HStack {
                Button(action: {self.startNewGame()}) {
                    HStack{
                        Image("StartOverIcon")
                        Text("Start Over")
                        .modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button"))
                Spacer()
                Text("Score: ").modifier(LabelStyle())
                Text("\(totalScore)").modifier(ValueStyle())
                Spacer()
                Text("Round: ").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info")
                        .modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button"))
            }
            .padding(.bottom, 10)
        }
        .background(Image("Background"), alignment: .center)
    .accentColor(midnightBlue)
    .navigationBarTitle(Text("Bullseye"))
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
