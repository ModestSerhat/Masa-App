//
//  MeetingsView.swift
//  Masa App
//
//  Created by Serhat İşbakan on 23.04.2024.
//

import SwiftUI

struct MeetingsView: View {
    @ObservedObject var profData: ProfileData
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Meetings").bold().font(.title)
                ScrollView {
                    ForEach(profData.meetings) { meeting in
                        MeetingInfoView(meeting: meeting).frame(width: geometry.size.width / 1.15, height: geometry.size.height/10)
                        Spacer().frame(height: geometry.size.height/20)
                    }
                }
            }.padding(geometry.size.width/17.5)
        }.background(Color.gray.opacity(0.2))
    }
}
