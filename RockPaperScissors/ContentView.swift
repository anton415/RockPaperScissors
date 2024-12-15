//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Anton Serdyuchenko on 15.12.2024.
//
//  Challenge is to make a brain training game that challenges players to win or lose at rock, paper, scissors.

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var winningMoves = ["Paper", "Scissors", "Rock"]
    @State private var appCurrentMove = Int.random(in: 0...2)
    @State private var isWin = Bool.random()
    @State private var score = 0
    @State private var showingAlert = false
    @State private var scoreTitle = ""
    
    var body: some View {
        VStack {
            Text("player’s score: \(score)")
            Text("computer’s move: \(moves[appCurrentMove])")
            Text(isWin ? "should win" : "should lose")
            HStack {
                ForEach(0..<3) { number in
                    Button {
                        makeMove(number)
                    } label: {
                        Text("\(winningMoves[number])")
                    }
                }
            }
            Button {
                score = 0
            } label: {
                Text("resert game")
            }
        }
        .padding()
        .alert(scoreTitle, isPresented: $showingAlert) {
            Button("Continue", action: shuffleMoves)
        }
    }
    
    func makeMove(_ number: Int) {
        if isWin {
            if number == appCurrentMove {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong"
                score -= 1
            }
        } else {
            if number != appCurrentMove {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong"
                score -= 1
            }
        }
        showingAlert = true
    }
    
    func shuffleMoves() {
        appCurrentMove = Int.random(in: 0...2)
        isWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
