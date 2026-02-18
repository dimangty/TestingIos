//
//  LoginViewTests.swift
//  TestingTask
//
//  Created by Igor Kislyuk on 27.01.2026.
//

import ViewInspector
import XCTest
import Testing
@testable import TestingTask

@Suite
struct LoginViewTests {
    @Test
    @MainActor
    func testInitialState() throws {
        let view = LoginView(viewModel: LoginViewModel())

        let button = try view.inspect().vStack().button(1)

        #expect(button.isDisabled())
    }

    @Test
    @MainActor
    func testPhoneInput() throws {
        let vm = LoginViewModel()
        vm.phone = "79117486002"
        let view = LoginView(viewModel: vm)

        let button = try view.inspect().vStack().button(1)

        #expect(!button.isDisabled())
    }
}

final class XCLoginViewTests: XCTestCase {

    @MainActor
    func testInitialState() throws {
        // given
        let view = LoginView(viewModel: LoginViewModel())

        // when
        let button = try view.inspect().vStack().button(1)

        // then
        XCTAssertTrue(button.isDisabled())
    }
}
