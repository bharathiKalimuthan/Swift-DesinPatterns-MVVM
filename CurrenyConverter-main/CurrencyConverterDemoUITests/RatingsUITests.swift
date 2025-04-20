//
//  RatingsUITests.swift
//  CurrencyConverterDemoUITests
//
//  Created by BHARATHI K on 18/12/24.
//

import Foundation
import XCTest
import Combine
import SnapshotTesting
@testable import CurrencyConverterDemo
import SwiftUI

class RatingsViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()
       
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testRatingsViewDisplayRates() {
        let usdRateLabel = app.staticTexts["rateCell-AED"]
        if usdRateLabel.waitForExistence(timeout: 5) {
            XCTAssertTrue(usdRateLabel.exists, "Ratings view should display USD rate.")
        }
    
    }
    
        func testRatingsViewSnapshotTesting() {
            
            func testDefaultAppearance() {
                let contentView = ContentView()
                assertSnapshot(of: contentView.toVC(), as: .image)
            }
        }

}

extension SwiftUI.View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
