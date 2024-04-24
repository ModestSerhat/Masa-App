import SwiftUI

struct SubjectInfoView: View {
    var subject: Subject
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(colors: [subject.firstColor, subject.secondColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text(subject.name).bold().foregroundColor(.white)
            }
    }
}
