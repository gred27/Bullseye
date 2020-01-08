//
//  AboutView.swift
//  BullseyePractice
//
//  Created by 박지홍 on 2020/01/08.
//  Copyright © 2020 Jihong Park. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    struct AboutHeadingStyle: ViewModifier {
           func body(content:Content) -> some View {
               return content
                   .foregroundColor(Color.black)
                   .font( Font.custom("ArialRoundedMTBold", size: 30))
                    .padding(.top,20)
                    .padding(.bottom, 20)
                   
           }
       }
    struct AboutBodyStyle: ViewModifier {
        func body(content:Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font( Font.custom("ArialRoundedMTBold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 80)
                .padding(.bottom, 20)
                
        }
    }
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
                Text("This is the awesome game of Bull's Eye where you can win points and earn fame by dragging a slider.").modifier(AboutBodyStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutBodyStyle())
                Text("Enjoy!").modifier(AboutBodyStyle())
            }
            .navigationBarTitle(Text("About Bullseye"))
            .background(beige)
        }
        .background(Image("Background"))
        .navigationBarTitle(Text("About"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
