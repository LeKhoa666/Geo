//
//  ContentView.swift
//  week01_khoa
//
//  Created by MAY 05 on 14/9/26.
//
import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = ""
    @State private var result = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Number Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Enter n:")
                    .font(.headline)
                
                TextField("Enter a number", text: $inputNumber)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numbersAndPunctuation)
            }
            
            VStack(spacing: 12) {
                
                Button {
                    calculateSquare()
                } label: {
                    Text("Calculate n²")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .cornerRadius(8)
                }
                
                Button {
                    calculateCube()
                } label: {
                    Text("Calculate n³")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.purple)
                        .cornerRadius(8)
                }
                
                Button {
                    doubleNumber()
                } label: {
                    Text("Double n")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.green)
                        .cornerRadius(8)
                }
            }
            
            Text("Result: \(result)")
                .font(.title3)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
        .padding()
    }
    
    func calculateSquare() {
        if let number = Double(inputNumber) {
            result = String(number * number)
        } else {
            result = "Invalid input"
        }
    }
    
    func calculateCube() {
        if let number = Double(inputNumber) {
            result = String(number * number * number)
        } else {
            result = "Invalid input"
        }
    }
    
    func doubleNumber() {
        if let number = Double(inputNumber) {
            result = String(number * 2)
        } else {
            result = "Invalid input"
        }
    }
}

#Preview {
    ContentView()
}
