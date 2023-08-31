//
//  ViewModel.swift
//  HoraMexico
//
//  Created by ALAN CARO on 31/08/23.
//

import Foundation

struct ViewModel {
    
    var test = ""
    
    mutating func getTimeInEU() -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "America/New_York")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let euDate = Date()
        print(euDate)

//        let euTime = dateFormatter.string(from: euDate)
////        print("HORA EN EU ES:")
//        print(euTime)
        
        test = dateFormatter.string(from: euDate)
        print(test)
        
        let dateFormatttt = DateFormatter()
        dateFormatttt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatttt.date(from: test) {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            print("Hora:", hour)
            print("Minutos:", minutes)
            print("Segundos:", seconds)
        }
        
        
        
        return test
    }
    
}
