//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Joel Lacerda on 14/11/25.
//

import SwiftUI

struct MatchMarkers: View {
    var matches: [Match]
    
    var body: some View {
        HStack {
            VStack {
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
        }
    }
    
    @ViewBuilder
    func matchMarker(peg: Int) -> some View {
        let exactCount = matches.count { $0 == .exact }
        let foundCount = matches.count { $0 != .noMatch }
        Circle()
            .fill(exactCount > peg ? .primary : Color.clear)
            .strokeBorder(foundCount > peg ? .primary : Color.clear, lineWidth: 3)
            .aspectRatio(1, contentMode: .fit)
    }
}

enum Match {
    case noMatch
    case exact
    case inexact
}

#Preview {
    MatchMarkers(matches: [.inexact, .noMatch, .exact, .exact])
        .padding()
}
