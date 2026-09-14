//
//  ContentView.swift
//  Homework01_khoa
//
//  Created by MAY 05 on 14/9/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberInput = ""
    @State private var number2Input = ""
    
    @State private var squareResult = ""
    @State private var cubeResult = ""
    @State private var factorialResult = ""
    @State private var primeResult = ""
    
    @State private var gcdResult = ""
    @State private var lcmResult = ""
    
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - Header
                    
                    VStack(spacing: 5) {
                        Text("☀️")
                            .font(.system(size: 35))
                        
                        Text("Number Tools")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(.blue)
                        
                        Text("Small numbers, big possibilities!")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    // MARK: - Single Number
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Single Number (n)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                        
                        Text("Enter a number:")
                            .font(.headline)
                        
                        TextField("Enter n", text: $numberInput)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numbersAndPunctuation)
                        
                        HStack(spacing: 8) {
                            
                            Button {
                                calculateSquare()
                            } label: {
                                VStack {
                                    Text("n²")
                                        .font(.title3)
                                        .bold()
                                    Text("Square")
                                        .font(.caption)
                                }
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(.blue)
                                .cornerRadius(10)
                            }
                            
                            Button {
                                calculateCube()
                            } label: {
                                VStack {
                                    Text("n³")
                                        .font(.title3)
                                        .bold()
                                    Text("Cube")
                                        .font(.caption)
                                }
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(.purple)
                                .cornerRadius(10)
                            }
                            
                            Button {
                                calculateFactorial()
                            } label: {
                                VStack {
                                    Text("n!")
                                        .font(.title3)
                                        .bold()
                                    Text("Factorial")
                                        .font(.caption)
                                }
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(.pink)
                                .cornerRadius(10)
                            }
                            
                            Button {
                                checkPrime()
                            } label: {
                                VStack {
                                    Text("Prime?")
                                        .font(.title3)
                                        .bold()
                                    Text("Check")
                                        .font(.caption)
                                }
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(.green)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.08))
                    .cornerRadius(15)
                    
                    // MARK: - Single Number Results
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Results for n = \(numberInput.isEmpty ? "-" : numberInput)")
                            .font(.headline)
                            .foregroundStyle(.blue)
                        
                        HStack(spacing: 8) {
                            
                            resultBox(
                                title: "n²",
                                value: squareResult,
                                color: .blue
                            )
                            
                            resultBox(
                                title: "n³",
                                value: cubeResult,
                                color: .purple
                            )
                            
                            resultBox(
                                title: "n!",
                                value: factorialResult,
                                color: .pink
                            )
                            
                            resultBox(
                                title: "Prime?",
                                value: primeResult,
                                color: .green
                            )
                        }
                    }
                    .padding()
                    .background(Color.pink.opacity(0.05))
                    .cornerRadius(15)
                    
                    // MARK: - Two Numbers
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Two Numbers (a, b)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                        
                        HStack(spacing: 15) {
                            
                            VStack(alignment: .leading) {
                                Text("Enter a:")
                                    .font(.headline)
                                
                                TextField("a", text: $numberInput)
                                    .textFieldStyle(.roundedBorder)
                                    .keyboardType(.numbersAndPunctuation)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Enter b:")
                                    .font(.headline)
                                
                                TextField("b", text: $number2Input)
                                    .textFieldStyle(.roundedBorder)
                                    .keyboardType(.numbersAndPunctuation)
                            }
                        }
                        
                        HStack(spacing: 10) {
                            
                            Button {
                                calculateGCD()
                            } label: {
                                Text("UCLN (GCD)")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.green)
                                    .cornerRadius(10)
                            }
                            
                            Button {
                                calculateLCM()
                            } label: {
                                Text("BCNN (LCM)")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.orange)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.08))
                    .cornerRadius(15)
                    
                    // MARK: - Two Number Results
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Results for a = \(numberInput.isEmpty ? "-" : numberInput), b = \(number2Input.isEmpty ? "-" : number2Input)")
                            .font(.headline)
                            .foregroundStyle(.blue)
                        
                        HStack(spacing: 10) {
                            
                            resultBox(
                                title: "UCLN (GCD)",
                                value: gcdResult,
                                color: .green
                            )
                            
                            resultBox(
                                title: "BCNN (LCM)",
                                value: lcmResult,
                                color: .orange
                            )
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.05))
                    .cornerRadius(15)
                    
                    // MARK: - Error
                    
                    if !errorMessage.isEmpty {
                        Text("⚠️ \(errorMessage)")
                            .font(.headline)
                            .foregroundStyle(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(10)
                    }
                    
                    // MARK: - Bottom Buttons
                    
                    HStack(spacing: 15) {
                        
                        Button {
                            clearAll()
                        } label: {
                            Label("Clear All", systemImage: "trash")
                                .fontWeight(.bold)
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red.opacity(0.1))
                                .cornerRadius(10)
                        }
                        
                        Button {
                            showHelp()
                        } label: {
                            Label("Help", systemImage: "questionmark.circle")
                                .fontWeight(.bold)
                                .foregroundStyle(.blue)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Result Box
    
    @ViewBuilder
    func resultBox(title: String, value: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text(value.isEmpty ? "-" : value)
                .font(.title3)
                .fontWeight(.bold)
        }
        .foregroundStyle(color)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 15)
        .background(color.opacity(0.1))
        .cornerRadius(10)
    }
    
    // MARK: - n²
    
    func calculateSquare() {
        guard let n = Int(numberInput) else {
            errorMessage = "Please enter a valid integer."
            return
        }
        
        squareResult = String(n * n)
        errorMessage = ""
    }
    
    // MARK: - n³
    
    func calculateCube() {
        guard let n = Int(numberInput) else {
            errorMessage = "Please enter a valid integer."
            return
        }
        
        cubeResult = String(n * n * n)
        errorMessage = ""
    }
    
    // MARK: - Factorial
    
    func calculateFactorial() {
        guard let n = Int(numberInput) else {
            errorMessage = "Please enter a valid integer."
            return
        }
        
        if n < 0 {
            factorialResult = ""
            errorMessage = "Factorial is not defined for negative numbers."
            return
        }
        
        if n > 20 {
            factorialResult = ""
            errorMessage = "Please enter a number from 0 to 20 for factorial."
            return
        }
        
        var factorial = 1
        
        if n > 0 {
            for i in 1...n {
                factorial *= i
            }
        }
        
        factorialResult = String(factorial)
        errorMessage = ""
    }
    
    // MARK: - Prime Check
    
    func checkPrime() {
        guard let n = Int(numberInput) else {
            errorMessage = "Please enter a valid integer."
            return
        }
        
        if n < 2 {
            primeResult = "No"
            errorMessage = ""
            return
        }
        
        if n == 2 {
            primeResult = "Yes"
            errorMessage = ""
            return
        }
        
        if n % 2 == 0 {
            primeResult = "No"
            errorMessage = ""
            return
        }
        
        var isPrime = true
        var i = 3
        
        while i * i <= n {
            if n % i == 0 {
                isPrime = false
                break
            }
            i += 2
        }
        
        primeResult = isPrime ? "Yes" : "No"
        errorMessage = ""
    }
    
    // MARK: - GCD
    
    func calculateGCD() {
        guard let a = Int(numberInput),
              let b = Int(number2Input) else {
            errorMessage = "Please enter two valid integers."
            return
        }
        
        if a == 0 && b == 0 {
            errorMessage = "GCD of 0 and 0 is not defined."
            return
        }
        
        gcdResult = String(gcd(abs(a), abs(b)))
        errorMessage = ""
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        
        while y != 0 {
            let temp = x % y
            x = y
            y = temp
        }
        
        return abs(x)
    }
    
    // MARK: - LCM
    
    func calculateLCM() {
        guard let a = Int(numberInput),
              let b = Int(number2Input) else {
            errorMessage = "Please enter two valid integers."
            return
        }
        
        if a == 0 || b == 0 {
            lcmResult = "0"
            errorMessage = ""
            return
        }
        
        let greatestCommonDivisor = gcd(abs(a), abs(b))
        let leastCommonMultiple = abs(a / greatestCommonDivisor * b)
        
        lcmResult = String(leastCommonMultiple)
        errorMessage = ""
    }
    
    // MARK: - Clear
    
    func clearAll() {
        numberInput = ""
        number2Input = ""
        
        squareResult = ""
        cubeResult = ""
        factorialResult = ""
        primeResult = ""
        
        gcdResult = ""
        lcmResult = ""
        
        errorMessage = ""
    }
    
    // MARK: - Help
    
    func showHelp() {
        errorMessage = "Enter an integer and choose an operation. For two-number operations, enter both a and b."
    }
}

#Preview {
    ContentView()
}
