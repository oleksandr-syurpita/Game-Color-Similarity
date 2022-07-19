//
//  ContentView.swift
//  GameColorSimilarity
//
//  Created by admin on 19.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var RColor: Double = 0
    @State var GColor: Double = 0
    @State var BColor: Double = 0
    @State var RandomColor = Color.black
    @State var RandomRColor: Double = 0
    @State var RandomGColor: Double = 0
    @State var RandomBColor: Double = 0
    @State private var alertShow = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    HStack {
                        Text("")
                    }
                    .frame(width: 100, height: 200)
                    .background(RandomColor)
                    HStack {
                        Text("")
                    }
                    .frame(width: 100, height: 200)
                    .background(Color(red: RColor , green: GColor , blue: BColor))
                }
                Text("Red Color \(Int(RandomRColor))\n Green Color \(Int(RandomGColor)) \n Blue Color \(Int(RandomBColor)) \n")
                
                Button(action: { newColor() }) {
                    Text("Tap me for generate new color")
                }
                Slider(value: $RColor)
                    .frame(width: 255, height: 40)
                Slider(value: $GColor)
                    .frame(width: 255, height: 40)
                Slider(value: $BColor)
                    .frame(width: 255, height: 40)
                
                Text("Red Color \(Int(RColor * 255 ))\n Green Color \(Int(GColor * 255 ))\n Blue Color \(Int(BColor * 255))\n")
                Button(action: { self.alertShow = true }) {
                    Text("Hit me")
                }.alert(isPresented: $alertShow) {
                    Alert(title: Text("Your Score"),
                          message: Text(String(computeScore())))
                }
            }
        }
    }
    func newColor() {
        let RColorrandom = Double.random(in: 0...255)
        let GColorrandom = Double.random(in: 0...255)
        let BColorrandom = Double.random(in: 0...255)
        let randomColor = Color(red: RColorrandom / 255, green: GColorrandom / 255, blue: BColorrandom / 255)
        self.RandomColor = randomColor
        self.RandomRColor = RColorrandom
        self.RandomGColor = GColorrandom
        self.RandomBColor = BColorrandom
    }
    func computeScore() -> Int {
        let temp =  Double(round(100 * RandomRColor)/100) / 255
        let temp2 = Double(round(100 * RandomGColor)/100) / 255
        let temp3 = Double(round(100 * RandomBColor)/100) / 255
        let RFinal = Double(round(100 * RColor)/100) - temp
        let GFinal = Double(round(100 * GColor)/100) - temp2
        let BFinal = Double(round(100 * BColor)/100) - temp3
        let diff = sqrt(
            (RFinal * RFinal + GFinal * GFinal + BFinal * BFinal) / 3.0)
        return lround((1.0 - diff) * 100.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
