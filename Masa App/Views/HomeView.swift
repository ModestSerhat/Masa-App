import SwiftUI

struct HomeView: View {
    @ObservedObject var profData: ProfileData
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                VStack (alignment: .leading){
                    Text("Hi \(profData.name),").font(.title).bold()
                    Text("You are ready today!")
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(profData.meetings.count)").font(.title).bold().foregroundColor(.white) +
                                Text(" meetings").foregroundColor(.white)
                            }
                            Text("You have \(profData.meetings.count) meetings, \(profData.countCriticalTasks()) critical tasks and \(profData.tasks.count) tasks.").foregroundColor(.white).font(.caption)
                        }
                        Spacer()
                        Button  {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12.5)
                                    .foregroundColor(.white)
                                Text("Control Tasks").font(.footnote)
                            }.frame(width: geometry.size.width / 4, height: geometry.size.height/30)
                        }
                    }.padding(geometry.size.width / 25)
                }.frame(width: geometry.size.width / 1.15)
                Spacer().frame(height: geometry.size.height/40)
                Text("\(profData.meetings.count) meetings").bold()
                ScrollView(.horizontal) {
                    VStack {
                        HStack {
                            ForEach(profData.meetings.prefix(profData.meetings.count/2)) { meeting in
                                MeetingInfoView(meeting: meeting).frame(width: geometry.size.width / 2.35, height: geometry.size.height/10)
                            }
                        }
                        HStack {
                            ForEach(profData.meetings.suffix(profData.meetings.count/2)) { meeting in
                                MeetingInfoView(meeting: meeting).frame(width: geometry.size.width / 2.35, height: geometry.size.height/10)
                            }
                        }
                    }
                }.frame(width: geometry.size.width / 1.15)
                Spacer().frame(height: geometry.size.height/40)
                Text("Subjects").bold()
                ScrollView(.horizontal) {
                    VStack {
                        HStack {
                            ForEach(profData.subjects.prefix(profData.subjects.count/2)) { subject in
                                SubjectInfoView(subject: subject).frame(width: geometry.size.width / 2.35, height: geometry.size.height/10)
                            }
                        }
                        HStack {
                            ForEach(profData.subjects.suffix(profData.subjects.count/2)) { subject in
                                SubjectInfoView(subject: subject).frame(width: geometry.size.width / 2.35, height: geometry.size.height/10)
                            }
                        }
                    }
                }.frame(width: geometry.size.width / 1.15)
            }.padding(geometry.size.width / 17.5)
        }.background(Color.gray.opacity(0.2))
    }
}
