//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Dane Miller on 2023/06/01.
//

import SwiftUI

struct MeetingTimerView: View {
    let theme : Theme
    let speakers : [ScrumTimer.Speaker]
    let isRecording : Bool
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    private var totalSeconds: Int {
            secondsElapsed + secondsRemaining
    }
    
    private var currentSpeaker: String {
            speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
        }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay{
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")

                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
//            .overlay {
//
//                MeetingArc(secondsElapsed: secondsElapsed, totalSeconds: totalSeconds)
//                                    .rotation(Angle(degrees: -90))
//                                    .stroke(theme.accentColor, lineWidth: 12)
//                                    .colorInvert()
//
//            }
            .overlay {
                ForEach(speakers) { speaker in
                    
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                                    .rotation(Angle(degrees: -90))
                                    .stroke(theme.mainColor, lineWidth: 12)

                    }
                    
                }
            }
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
            [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
        }
    static var previews: some View {
        MeetingTimerView(theme: .bubblegum, speakers: speakers, isRecording: true, secondsElapsed: 10, secondsRemaining: 5)
    }
}
