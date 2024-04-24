import SwiftUI

struct SubjectsView: View {
    @ObservedObject var profData: ProfileData
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Subjects").bold().font(.title).foregroundColor(.white)
                ScrollView {
                    ZStack {
                        ForEach (profData.subjects) { subject in
                            ZStack {
                                RoundedRectangle(cornerRadius: 15).fill(LinearGradient(colors: [subject.firstColor, subject.secondColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                                HStack {
                                    Spacer()
                                    Text(subject.name).font(.title).bold().foregroundColor(.white)
                                }.padding(geometry.size.width/15)
                            }.frame(width: geometry.size.width/1.2, height: geometry.size.height/5)
                                .offset(x: CGFloat(firstIndexSubjectArray(of: subject, in: profData.subjects) * -geometry.size.width/20) < -geometry.size.width / 5 ? -geometry.size.width / 5: CGFloat(firstIndexSubjectArray(of: subject, in: profData.subjects) * -geometry.size.width/20), y: CGFloat(firstIndexSubjectArray(of: subject, in: profData.subjects) * geometry.size.height/5.75))
                        }
                    }
                }
            }.padding(geometry.size.width / 17.5)
        }.background(Color(red: 0.25, green: 0.125, blue: 0.375))
    }
}
