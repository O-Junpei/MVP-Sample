import XCTest

class MVPUITests: XCTestCase {
    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    func testSampleListViewController_20190404() {
        
        let app = XCUIApplication()
        
        // 「Get 「=」 Button
        let resultButton = app.buttons["resultButton"]
        
        // 「=」 Button is disable
        XCTAssertFalse(resultButton.isEnabled)
        
        // Get LeftTestField
        let leftValueTextField = app.textFields["leftValueTextField"]
        
        // Focus LeftTestField
        leftValueTextField.tap()
        
        // Input 12
        leftValueTextField.typeText("12")
        
        // 「=」 Button is disable
        XCTAssertFalse(resultButton.isEnabled)
        
        // Get RightTestField
        let rightValueTextField = app.textFields["rightValueTextField"]
        
        // Focus RightTestField
        rightValueTextField.tap()
        
        // Input 4
        rightValueTextField.typeText("4")
        
        // 「=」 Button is enabled
        XCTAssertTrue(resultButton.isEnabled)
        
        // Tap 「=」 Button
        app.buttons["resultButton"].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        
        // Assert resultLabel.label = 48
        XCTAssertEqual(resultLabel.label, "48.0")
    }
}
