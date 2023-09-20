//
//  ContentView.swift
//  animalnese
//
//  Created by Logan  Jackson on 9/18/23.
//

import SwiftUI
import AVFoundation
import CoreMIDI

let synth = AVSpeechSynthesizer()

func clean(_ text: String) -> String {
    var result = ""
    for c in text {
        if c.isLetter {
            result += c.lowercased()
        }
    }
    return result
}

func playSound(_ text: String) {
    // need to figure how it's generated...
    let cleanText = clean(text)
    for c in cleanText {
        let speechUtterence = AVSpeechUtterance(string: "\(c)")
        speechUtterence.rate = MAXFLOAT
        speechUtterence.pitchMultiplier = Float.random(in: -2.0..<0.0)
        speechUtterence.voice = AVSpeechSynthesisVoice(language: "en-US")
        synth.speak(speechUtterence)
    }
}

struct ContentView: View {
    @State private var text: String = ""
    var body: some View {
        VStack {
            Text("Animalnese")
                .font(.title)
            TextField("Enter words...", text: $text)
                .multilineTextAlignment(.center)
            Button(action: {
                playSound(text)
            }) {
                Text("Speak!")
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
