//
//  LoginViewSnapshot.swift
//  TestingTask
//
//  Created by Igor Kislyuk on 27.01.2026.
//

import SnapshotTesting
import Testing
import SwiftUI
import CoreGraphics
@testable import TestingTask

@MainActor
struct LoginViewSnapshotTests {
    @Test func loginView() {
        // given
        let view = LoginView()

        // when
        let hostingController = UIHostingController(rootView: view)

        // then
        assertSnapshot(
            of: hostingController,
            as: .image(
                // CRITICAL: Set an explicit, reproducible size
                size: CGSize(width: 350, height: 200)
            ),
            record: false // Set to true to update the reference image
        )
    }
}
