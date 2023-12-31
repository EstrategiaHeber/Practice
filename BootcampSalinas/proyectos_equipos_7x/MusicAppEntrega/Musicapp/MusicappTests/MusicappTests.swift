//
//  MusicappTests.swift
//  MusicappTests
//
//  Created by MacBook on 18/01/23.
//

import XCTest
import Combine
@testable import Musicapp

final class MusicappTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    var songsFetchedSubscriber: AnyCancellable?
    
    func testPlayerService() async {
        
        let service = PlayerService()
        
        songsFetchedSubscriber = service.songsFetchedSubject.sink {
            
            error in
            
            print("Error: \(error)")
            
        } receiveValue: {
            
            songs in
            
            print("Downloaded songs: \(songs)")
            
        }
        
        await service.downloadSongs()

        try? await Task.sleep(until: .now + .seconds(3), clock: .continuous)
        
        songsFetchedSubscriber?.cancel()
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
