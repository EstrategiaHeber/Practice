//
//  ContentView.swift
//  Cronometro
//
//  Created by ALAN CARO on 31/08/23.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// MARK: INICIAR EL CRONOMETRO

//import SwiftUI
//
//struct ContentView: View {
//    @State private var timeElapsed: TimeInterval = 0
//    @State private var timer: Timer? = nil
//    @State private var isRunning = false
//
//    var body: some View {
//        VStack {
//
//
//            Text("\(timeElapsed.formatted())")
//                .font(.largeTitle)
//
//            if timeElapsed == 10 {
//                Text("Llego a 30")
//            }
//
//            Button(action: {
//                if isRunning {
//                    timer?.invalidate()
//                } else {
//                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//                        timeElapsed += 1
//                    }
//                }
//                isRunning.toggle()
//            }) {
//                Text(isRunning ? "Stop" : "Start")
//                    .padding(.horizontal)
//                    .padding(.vertical, 8)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
//        }
//        .padding()
//    }
//}
//
//extension TimeInterval {
//    func formatted() -> String {
//        let minutes = Int(self) / 60
//        let seconds = Int(self) % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// MARK: REINICIAR EL CRONOMETRO

//import SwiftUI
//
//struct ContentView: View {
//    @State private var timeElapsed: TimeInterval = 0
//    @State private var timer: Timer? = nil
//    @State private var isRunning = false
//
//    var body: some View {
//        VStack {
//            Text("\(timeElapsed.formatted())")
//                .font(.largeTitle)
//
//            Button(action: {
//                if isRunning {
//                    timer?.invalidate()
//                } else {
//                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//                        updateTime()
//                    }
//                }
//                isRunning.toggle()
//            }) {
//                Text(isRunning ? "Stop" : "Start")
//                    .padding(.horizontal)
//                    .padding(.vertical, 8)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
//        }
//        .padding()
//    }
//
//    private func updateTime() {
//        if timeElapsed < 10 {
//            timeElapsed += 1
//        } else {
//            timeElapsed = 0 // Reiniciar el cronómetro cuando llegue a 30 segundos
//        }
//    }
//}
//
//extension TimeInterval {
//    func formatted() -> String {
//        let minutes = Int(self) / 60
//        let seconds = Int(self) % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// MARK: REINICIAR Y DETENER EL CRONOMETRO
import SwiftUI

struct ContentView: View {
    @State private var timeElapsed: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var isRunning = false

    var body: some View {
        VStack {
            if isRunning {
                Text("\(timeElapsed.formatted())")
                    .font(.largeTitle)
            } else {
                Text("Ya ganaste")
            }
            
            Button(action: {
                if isRunning {
                    stopTimer()
                } else {
                    startTimer()
                }
            }) {
                Text(isRunning ? "Stop" : "Start")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateTime()
        }
        isRunning = true
    }

    private func stopTimer() {
        timer?.invalidate()
        isRunning = false
        timeElapsed = 0
    }

    private func updateTime() {
        if timeElapsed < 10 {
            timeElapsed += 1
        } else {
            stopTimer()
        }
    }
}

extension TimeInterval {
    func formatted() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
