//
//  TimerView.swift
//  TicTacToeAnimation2
//
//  Created by Grzegorz Baczek on 17/10/2021.
//

import Foundation
import SwiftUI

struct TimerShape: Shape{
    
    var timeLeftPercent: CGFloat
    
    var animatableData: CGFloat{
        get{
            return timeLeftPercent
        }
        set{
            timeLeftPercent = newValue
        }
    }
    
    private var timeLeftToDegrees: Double{
        get{
            return Double(timeLeftPercent) * 360
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.height, rect.width) / 2
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        var path = Path()
        path.move(to: centerPoint)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + radius))
        path.addArc(center: centerPoint, radius: radius, startAngle: .degrees(0 + 90), endAngle: .degrees(timeLeftToDegrees + 90), clockwise: false)
        path.addLine(to: centerPoint)
        return path
    }
}

struct TimeShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            VStack{
                Spacer()
                TimerShape(timeLeftPercent: 0.7)
                    .fill(.orange)
                    
                Spacer()
            }
        }
    }
}
