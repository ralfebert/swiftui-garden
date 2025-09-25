// » SwiftUI Garden
// » https://swiftui-garden.com/Animations/Animation-playground

import SwiftUI

struct AnimatedClockTimelineViewExample: View {
    @State private var currentTime = Date()

    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            let angles = ClockAngles(date: context.date)

            VStack(spacing: 32) {
                ZStack {
                    Circle()
                        .stroke(.primary, lineWidth: 4)
                        .frame(width: 200, height: 200)

                    hand(width: 4, height: 60, angle: angles.hourAngle)
                        .foregroundStyle(.primary)

                    hand(width: 2, height: 80, angle: angles.minuteAngle)
                        .foregroundStyle(.primary)

                    hand(width: 1, height: 90, angle: angles.secondAngle)
                        .foregroundStyle(.red)
                }

                Text(context.date, style: .time)
                    .font(.title2.bold())
            }
        }
    }

    func hand(width: CGFloat, height: CGFloat, angle: Angle) -> some View {
        Rectangle()
            .frame(width: width, height: height)
            .offset(y: -height / 2)
            .rotationEffect(angle)
    }
}

struct ClockAngles {
    let calendar = Calendar.current
    let date: Date

    var hour: Int {
        calendar.component(.hour, from: date)
    }

    var minute: Int {
        calendar.component(.minute, from: date)
    }

    var second: Int {
        calendar.component(.second, from: date)
    }

    var hourAngle: Angle {
        .degrees(Double(hour % 12) * 30 + Double(minute) * 0.5)
    }

    var minuteAngle: Angle {
        .degrees(Double(minute) * 6)
    }

    var secondAngle: Angle {
        .degrees(Double(second) * 6)
    }
}

#Preview {
    AnimatedClockTimelineViewExample()
}
