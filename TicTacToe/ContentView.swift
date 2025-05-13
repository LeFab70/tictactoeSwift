//
//  ContentView.swift
//  TicTacToe
//
//  Created by prof005 on 2024-06-18.
//

import SwiftUI

struct ContentView: View {
    @State private var board: [[String]] = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
    ]
    @State private var currentPlayer = "X"
    @State private var winner: String="";
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Button(action: { buttonTapped(row: 0, column: 0) }) {
                    Text(board[0][0])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
                Button(action: { buttonTapped(row: 0, column: 1) }) {
                    Text(board[0][1])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
                Button(action: { buttonTapped(row: 0, column: 2) }) {
                    Text(board[0][2])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
            }
            HStack(spacing: 10) {
                Button(action: { buttonTapped(row: 1, column: 0) }) {
                    Text(board[1][0])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
                Button(action: { buttonTapped(row: 1, column: 1) }) {
                    Text(board[1][1])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
                Button(action: { buttonTapped(row: 1, column: 2) }) {
                    Text(board[1][2])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
            }
            HStack(spacing: 10) {
                Button(action: { buttonTapped(row: 2, column: 0) }) {
                    Text(board[2][0])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
                Button(action: { buttonTapped(row: 2, column: 1) }) {
                    Text(board[2][1])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
    
                        
                }//.disabled(!winner.isEmpty)
                Button(action: { buttonTapped(row: 2, column: 2) }) {
                    Text(board[2][2])
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.black, width:1)
                        .cornerRadius(10)
                }
            }
            Text("Current Player: \(currentPlayer)")
                .font(.title)
                .padding(.top, 20)
            Text("Winner: \(winner)")
                .font(.title)
                .padding(.top, 20)
            Button(action: {resetBoard()}) {
                Text("Reset")
                    .font(.title2)
                    .padding()
                    .background(Color.red.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            
        }
    }
    
    private func buttonTapped(row: Int, column: Int) {
        if !board[row][column].isEmpty || !winner.isEmpty { return }
           board[row][column] = currentPlayer
           checkWinner()
           if winner.isEmpty {
               currentPlayer = (currentPlayer == "X") ? "O" : "X"
           }
    }
    
    private func resetBoard() {
        board = Array(repeating: Array(repeating: "", count: 3), count: 3)
        currentPlayer = "X"
        winner = ""
    }
    private func disableButton() {
        
    }
    
    private func checkWinner() {
        // Vérifie lignes
        for row in 0..<3 {
            if board[row][0] != "",
               board[row][0] == board[row][1],
               board[row][1] == board[row][2] {
                winner = board[row][0]
                return
            }
        }

        // Vérifie colonnes
        for col in 0..<3 {
            if board[0][col] != "",
               board[0][col] == board[1][col],
               board[1][col] == board[2][col] {
                winner = board[0][col]
                return
            }
        }

        // Vérifie diagonale \
        if board[0][0] != "",
           board[0][0] == board[1][1],
           board[1][1] == board[2][2] {
            winner = board[0][0]
            return
        }

        // Vérifie diagonale /
        if board[0][2] != "",
           board[0][2] == board[1][1],
           board[1][1] == board[2][0] {
            winner = board[0][2]
            return
        }
    }

}

#Preview {
    ContentView()
}
