//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Dane Miller on 2023/05/30.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
