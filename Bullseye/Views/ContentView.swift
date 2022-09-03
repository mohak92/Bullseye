//
//  ContentView.swift
//  Bullseye
//
//  Created by Mohak Tamhane on 8/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false;
    @State private var sliderValue: Double = 50.0;
    @State private var game: Game = Game();
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100)
            Text("100")
                .bold()
                .foregroundColor(Color("TextColor"))
            
        }
        .padding()
    }
}

struct HitMeButton: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.alertIsVisible = true;
            }
        }) {
            Text("Hit me".uppercased())
                .bold()
        }
        .padding(20.0)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        
        //        .alert("Hello there!", isPresented: $alertIsVisible) {
        //            Button("Awesome") {
        //                game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
        //            }
        //        } message: {
        //            let roundedValue: Int = Int(self.sliderValue.rounded())
        //            Text("The slider's value is \(roundedValue).\n" +
        //                 "You scored \(self.game.points(sliderValue: roundedValue)) points this round")
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .previewInterfaceOrientation(.landscapeRight)
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
