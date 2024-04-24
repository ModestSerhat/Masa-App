import SwiftUI

struct HelperSearchView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10).foregroundColor(Color.gray.opacity(0.2)).frame(minWidth: 285, minHeight: 30)
                Text("What can I do for you?").padding(7.5)
            }
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Get my day's summary")
                }.padding(2.5)
                HStack {
                    Image(systemName: "info.circle")
                    Text("Get my meeting summaries")
                }.padding(2.5)
                HStack {
                    Image(systemName: "info.circle")
                    Text("Show how many hours I worked")
                }.padding(2.5)
            }
            Spacer().frame(minHeight: 10, maxHeight: 15)
            Image(systemName: "sparkles")
        }
    }
}

#Preview {
    HelperSearchView()
}
