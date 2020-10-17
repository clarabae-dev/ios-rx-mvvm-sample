//
//  WeatherViewModelTest.swift
//  ios-rx-mvvm-sample-unit-tests
//
//  Created by seungminbae on 2020/10/16.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import XCTest
@testable import ios_rx_mvvm_sample

class WeatherUseCaseTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExecute() throws {
        //given
        let expectation = XCTestExpectation(description: "Fetch Weather Data")
        let useCase = DefaultFetchCurrentWeatherUseCase()
        //when
        useCase.execute { result in
            switch result {
            case .success(let weather):
                XCTAssertNotNil(weather.description)
                expectation.fulfill()
            case .failure(let reason):
                XCTFail("fail for fetch current weather data because: \(reason.debugDescription)")
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
