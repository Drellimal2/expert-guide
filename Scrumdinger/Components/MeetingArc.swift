//
//  MeetingArc.swift
//  Scrumdinger
//
//  Created by Dane Miller on 2023/06/01.
//

import SwiftUI

struct MeetingArc: Shape {
    
    let secondsElapsed: Int
    let totalSeconds: Int

    
    private var endAngle: Angle {
        Angle(degrees: Double(secondsElapsed * 360) / Double(totalSeconds))
    }
    
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0.0), endAngle: endAngle, clockwise: false)
        }
    }
    
    
}


