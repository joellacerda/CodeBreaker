//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Joel Lacerda on 14/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(colors: [.red, .green, .yellow, .green])
            pegs(colors: [.red, .green, .yellow, .blue])
            pegs(colors: [.red, .green, .yellow, .yellow])
        }
        .padding()
    }

    
    func pegs(colors: [Color]) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { i in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[i])
            }
            MatchMarkers(matches: [.inexact, .noMatch, .exact, .exact])
        }
    }
}

#Preview {
    ContentView()
}
