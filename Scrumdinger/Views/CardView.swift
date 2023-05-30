//
//  CardView.swift
//  Scrumdinger
//
//  Created by Dane Miller on 2023/05/30.
//

import SwiftUI

struct CardView: View {
    let scrum : DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                .accessibilityLabel("\(scrum.attendees.count) attendees")

                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes meeting")
                    .labelStyle(.trailingIcon)

            }.font(.caption)
        }
        .foregroundColor(scrum.theme.accentColor)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[2]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
