import SwiftUI

struct MeetingInfoView: View {
    var meeting: Meeting
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                VStack(alignment: .leading) {
                    Text(meeting.name).bold().font(.system(size: 14))
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).foregroundColor(meeting.subject.firstColor)
                            Text(meeting.subject.name).font(.system(size: 11))
                        }.frame(width: geometry.size.width/2.5, height: geometry.size.width/10)
                        Spacer()
                        HStack {
                            Image(systemName: "clock")
                            Spacer().frame(width: 10)
                            Text(getDateDifferenceTextFromNow(to: meeting.date)).font(.system(size: 12))

                        }.foregroundColor(Color.red)
                    }
                }.padding(geometry.size.width / 20)
            }
        }
    }
}
