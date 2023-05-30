//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Dane Miller on 2023/05/30.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
