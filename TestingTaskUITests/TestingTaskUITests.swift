//
//  TestingTaskUITests.swift
//  TestingTaskUITests
//
//  Created by Igor Kislyuk on 26.01.2026.
//

import XCTest

final class TestingTaskUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let phone = app.textFields["Phone Number"].firstMatch
        phone.tap()
        phone.typeText("79117486002")

        app.buttons["Confirm"].firstMatch.tap()

        app/*@START_MENU_TOKEN@*/.staticTexts["США вновь выслали группу россиян. Это как минимум четвертый депортационный рейс за последний год"]/*[[".buttons.staticTexts[\"США вновь выслали группу россиян. Это как минимум четвертый депортационный рейс за последний год\"]",".staticTexts[\"США вновь выслали группу россиян. Это как минимум четвертый депортационный рейс за последний год\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()

        app/*@START_MENU_TOKEN@*/.buttons["Love"]/*[[".scrollViews.buttons",".otherElements.buttons[\"Love\"]",".buttons[\"Love\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()

        let textElement = app.staticTexts["contentText"]
        let actualText = textElement.label

//        print("Текст элемента: \(actualText)")

        XCTAssertTrue(actualText.contains("России"))
        XCTAssert(textElement.waitForExistence(timeout: 3))
    }
}
