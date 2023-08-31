//
//  ContentView.swift
//  HoraMexico
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

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        Text(getTimeInMexico())
//            .font(.largeTitle)
//    }
//
//    func getTimeInMexico() -> String {
//
////        let dateFormatter = DateFormatter()
////        print("1")
////        print(dateFormatter)
////        dateFormatter.timeZone = TimeZone(identifier: "America/Mexico_City")
////        print("2")
////        print(dateFormatter.timeZone)
////        dateFormatter.dateFormat = "HH:mm:ss"
//
//        let localDate = Date()
//        print("3")
//        print(localDate)
//        let mexicoTimeZone = TimeZone(identifier: "America/Mexico_City")!
//        print("4")
//        print(mexicoTimeZone)
//        let mexicoDate = localDate.addingTimeInterval(TimeInterval(mexicoTimeZone.secondsFromGMT()))
//        print("5")
//        print(mexicoDate)
//
////        return dateFormatter.string(from: mexicoDate)
//        return mexicoDate.description
//    }
//}

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        Text(getTimeInMexico())
//            .font(.largeTitle)
//    }
//
//    func getTimeInMexico() -> String {
//        let mexicoTimeZone = TimeZone(identifier: "America/Mexico_City")!
//        let mexicoDate = Date().addingTimeInterval(TimeInterval(mexicoTimeZone.secondsFromGMT()))
//        print(mexicoDate)
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = mexicoTimeZone
//        dateFormatter.dateFormat = "HH:mm:ss"
//        print(dateFormatter.timeZone)
//
//        print("XXXX")
//        print(mexicoDate)
//        print("YYYYY")
//        print(dateFormatter.string(from: mexicoDate))
//
//        return dateFormatter.string(from: mexicoDate)
//
//    }
//}





import SwiftUI

struct ContentView: View {
    
    @State var test = ""
    
    var body: some View {
        VStack {
            Text(getTimeInMexico())
                .font(.largeTitle)

            Text(getTimeInEU())
                .font(.largeTitle)

            Text(String(getToken()))
                .font(.largeTitle)
        }
    }

    func getTimeInMexico() -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "America/Mexico_City")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //"HH:mm:ss"

        let mexicoDate = Date()
        let mexicoTime = dateFormatter.string(from: mexicoDate)
        
        let dateFormattte = DateFormatter()
        dateFormattte.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormattte.date(from: mexicoTime) {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let days = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            print("LA HORA DE MEXICO ES: \(date.description)")
            print("Dia:", days)
            print("Mes:", month)
            print("Hora:", hour)
            print("Minutos:", minutes)
            print("Segundos:", seconds)
        }
        
        return mexicoTime
    }

    func getTimeInEU() -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "America/New_York")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let euDate = Date()
        let euTime = dateFormatter.string(from: euDate)
        
        let dateFormatttt = DateFormatter()
        dateFormatttt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatttt.date(from: euTime) {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            print("LA HORA DE EU ES: \(date.description)")
            print("Hora:", hour)
            print("Minutos:", minutes)
            print("Segundos:", seconds)
        }
        
        return euTime
    }

    func getToken() -> Int {

        print("TOKEN")
        let date = Date()
        print(date)
        let calendar = Calendar.current
        print(calendar)
        let hour = calendar.component(.hour, from: date)
        print(hour)
        let days = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let minute = calendar.component(.minute, from: date)
       //print("h: "+hour.description+" days: "+days.description+" month: "+month.description)
        let v: Int = month + days + hour * minute
        let (_,rem) = (v.quotientAndRemainder(dividingBy: 7))
       //print("rem: "+rem.description)
       //print("v: "+v.description)
        let str: String = v.description + Int(rem).description
        let retorno:Int = Int(str) ?? 0
       //print(retorno)

        return retorno
    }
}


//import SwiftUI
//
//struct ContentView: View {
//
//    var body: some View {
//        Text(getTimeInMexico())
//            .font(.largeTitle)
//    }
//
//    func getTimeInMexico() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = TimeZone(identifier: "America/Mexico_City")
//        dateFormatter.dateFormat = "HH:mm:ss"
//
//        let mexicoDate = Date()
//        let mexicoTime = dateFormatter.string(from: mexicoDate)
//
//        // Convertir la cadena de tiempo de México nuevamente a un objeto Date
//        if let convertedDate = dateFormatter.date(from: mexicoTime) {
//
//            let convertedDateFormatter = DateFormatter()
//            convertedDateFormatter.timeZone = TimeZone(identifier: "America/Mexico_City")
//            convertedDateFormatter.dateFormat = "HH:mm:ss"
//
//            print("TEST")
//            print(convertedDate)
//
//            let convertedTimeString = convertedDateFormatter.string(from: convertedDate)
//            return "Formatted Time: \(mexicoTime) - Converted Time: \(convertedTimeString)"
//
//        } else {
//
//            return "Error al convertir la cadena a Date"
//        }
//    }
//}
