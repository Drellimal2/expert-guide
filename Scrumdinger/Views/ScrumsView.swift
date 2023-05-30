//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Dane Miller on 2023/05/30.
//

import SwiftUI

struct ScrumsView: View {
    var scrums : [DailyScrum]
    var body: some View {
        NavigationStack {
            List(scrums) {
                scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var scrums = DailyScrum.sampleData
    static var previews: some View {
        ScrumsView(scrums : scrums)
    }
}