//
//  ProfileView.swift
//  Masa App
//
//  Created by Serhat İşbakan on 23.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profData: ProfileData
    @State private var addSubjectName: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Profile").bold().font(.title)
                HStack {
                    Image(profData.profilePic)
                        .resizable()
                        .frame(width: geometry.size.width / 8, height: geometry.size.width / 8)
                    Text(profData.name).bold()
                }
                Divider()
                Text("Add Subject").bold()
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .background(Color.white).frame(width: geometry.size.width/1.15, height: 45)
                    HStack {
                        TextField("Subject name...", text: $addSubjectName)
                            .textFieldStyle(.plain)
                            .onSubmit {
                                profData.addSubject(addSubjectName)
                                addSubjectName = ""
                            }
                            .padding(10)
                        Spacer()
                        Button {
                            profData.addSubject(addSubjectName)
                            addSubjectName = ""
                        } label: {
                            Image(systemName: "plus")
                        }.padding(5)
                    }.frame(width: geometry.size.width/1.2, height: 40)
                        
                    }.frame(width: geometry.size.width/1.15, height: 40)
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
