import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case home = 0
    case subjects
    case meetings
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .subjects:
            return "Subjects"
        case .meetings:
            return "Meetings"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house.fill"
        case .subjects:
            return "book"
        case .meetings:
            return "person.2.fill"
        case .profile:
            return "profile"
        }
    }
    
    var isSystemImage: Bool {
        switch self {
        case .profile:
            return false
        default:
            return true
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case.subjects:
            return Color(red: 0.25, green: 0.125, blue: 0.375)
        default:
            return Color.gray.opacity(0.2)
        }
    }
}


struct CustomTabView: View {
    @State private var selectedTab = 0
    @State private var selectedColor = Color.gray.opacity(0.2)
    @State private var isShowingHelper = false
    @State private var isShowingNotificationBar = false
    @StateObject var profData = ProfileData()
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Button() {
                    print("Settings tapped!")
                } label: {
                    Image(systemName: "gearshape.fill")
                }
                Spacer()
                Button() {
                    isShowingHelper.toggle()
                } label: {
                    Image(systemName: "sparkles")
                }
                Button() {
                    isShowingNotificationBar.toggle()
                } label: {
                    Image(systemName: "bell")
                }
            }.padding(15)
            ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    HomeView(profData: profData)
                        .tag(0)
                    
                    SubjectsView(profData: profData)
                        .tag(1)
                    
                    MeetingsView(profData: profData)
                        .tag(2)
                    
                    ProfileView(profData: profData)
                        .tag(3)
                }
                ZStack {
                    HStack {
                        ForEach((TabbedItems.allCases), id: \.self){ item in
                            Button {
                                selectedTab = item.rawValue
                                selectedColor = item.backgroundColor
                            } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue), isSystemImage: item.isSystemImage)
                            }
                        }
                    }
                    .padding(6)
                }
                .frame(width: 360, height: 60)
                .cornerRadius(30)
            }
        }.background(selectedColor)
            .popover(isPresented: $isShowingHelper,
                     attachmentAnchor: .point(.top),
                     arrowEdge: .top,
                     content: {
                HelperSearchView()
                    .padding()
                    .presentationCompactAdaptation(.none)
            })
            .popover(isPresented: $isShowingNotificationBar,
                     attachmentAnchor: .point(.top),
                     arrowEdge: .top,
                     content: {
                HStack {
                    Image(systemName: "bell")
                    Text("No notifications")
                }
                    .padding()
                    .presentationCompactAdaptation(.none)
            })
    }
}

extension CustomTabView {
    func CustomTabItem (imageName: String, title: String, isActive: Bool, isSystemImage: Bool) -> some View{
        GeometryReader { geometry in
            VStack(spacing: 2){
                Spacer()
                if isSystemImage {
                    Image(systemName: imageName)
                        .foregroundColor(isActive ? .blue : .black)
                } else {
                    Image(profData.profilePic)
                        .resizable()
                        .frame(width: geometry.size.width / 3.75, height: geometry.size.width / 3.75)
                }
                Text(title)
                    .font(.system(size: geometry.size.width / 10))
                    .foregroundColor(isActive ? .blue : .black)
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(isActive ? .gray.opacity(0.2) : .clear)
            .cornerRadius(30)
        }
    }
}
