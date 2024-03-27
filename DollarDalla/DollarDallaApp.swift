//
//  DollarDallaApp.swift
//  DollarDalla
//
//  Created by 이서준 on 3/26/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct DollarDallaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: Finance.State()) {
                    Finance()
                        ._printChanges()
                }
            )
        }
    }
}
