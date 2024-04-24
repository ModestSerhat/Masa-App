import Foundation
import SwiftUI

class Subject: Identifiable {
    let name: String
    let firstColor: Color
    let secondColor: Color
    
    init(name: String, firstColor: Color, secondColor: Color) {
        self.name = name
        self.firstColor = firstColor
        self.secondColor = secondColor
    }
    
    init(name: String) {
        self.name = name
        var colors = [Color.red, Color.blue, Color.green, Color.yellow, Color.purple]
        let firstPick = Int.random(in: 0..<colors.count)
        self.firstColor = colors[firstPick]
        
        colors.remove(at: firstPick)
        
        let secondPick = Int.random(in: 0..<colors.count)
        self.secondColor = colors[secondPick]
    }
}

class Meeting: Identifiable {
    let name: String
    let date: Date
    let subject: Subject
    
    init(name: String, date: Date, subject: Subject) {
        self.name = name
        self.date = date
        self.subject = subject
    }
}

class Task {
    let name: String
    let critical: Bool
    
    init(name: String, critical: Bool) {
        self.name = name
        self.critical = critical
    }
}

class ProfileData: ObservableObject {
    @Published var name = "Pelin Su"
    @Published var profilePic = "profile"
    @Published var subjects = [Subject(name: "Customer", firstColor: Color.blue, secondColor: Color.purple), Subject(name: "Brainstorming", firstColor: Color.orange, secondColor: Color.yellow), Subject(name: "With team", firstColor: Color.purple, secondColor: Color.red), Subject(name: "Stakeholder", firstColor: Color.yellow, secondColor: Color.red), Subject(name: "Research and Development", firstColor: Color.blue, secondColor: Color.red)]
    @Published var meetings: [Meeting] = []
    @Published var tasks : [Task] = [Task(name: "Task 1", critical: true), Task(name: "Task 2", critical: false), Task(name: "Task 3", critical: true)]
    
    func addSubject(_ subjectName: String) {
        if !subjectName.isEmpty {
            for subject in subjects {
                if subject.name == subjectName {
                    break
                }
            }
            subjects.append(Subject(name: subjectName))
        }
    }
    
    func removeSubject(_ subjectName: String) {
        for i in 0..<subjects.count {
            if subjects[i].name == subjectName {
                subjects.remove(at: i)
                break
            }
        }
    }
    
    func countCriticalTasks() -> Int {
        var criticalCount = 0
        for task in tasks {
            if task.critical {
                criticalCount += 1
            }
        }
        return criticalCount
    }
    
    init() {
        let currentDate = Date()
        let calendar = Calendar.current
        
        var dateComponents1Hour30Mins = DateComponents()
        dateComponents1Hour30Mins.hour = 1
        dateComponents1Hour30Mins.minute = 30
        
        var dateComponents3Hours = DateComponents()
        dateComponents3Hours.hour = 3
        
        var dateComponents1Day = DateComponents()
        dateComponents1Day.day = 1
        
        var dateComponents2Days12Hours = DateComponents()
        dateComponents2Days12Hours.day = 2
        dateComponents2Days12Hours.hour = 12
        if let date1Hour30Mins = calendar.date(byAdding: dateComponents1Hour30Mins, to: currentDate),
           let date3Hours = calendar.date(byAdding: dateComponents3Hours, to: currentDate),
           let date1Day = calendar.date(byAdding: dateComponents1Day, to: currentDate),
           let date2Days12Hours = calendar.date(byAdding: dateComponents2Days12Hours, to: currentDate) {
            meetings.append(Meeting(name: "Daily meeting", date: date1Hour30Mins, subject: subjects[2]))
            meetings.append(Meeting(name: "Customer Insight", date: date3Hours, subject: subjects[0]))
            meetings.append(Meeting(name: "Brainstorming", date: date1Day, subject: subjects[2]))
            meetings.append(Meeting(name: "Sharing Session", date: date2Days12Hours, subject: subjects[3]))
        }
    }
}

func firstIndexSubjectArray(of element: Subject, in subjectArray: [Subject]) -> Double {
    var subjectIndex: Double = 0
    for subject in subjectArray {
        if subject.name == element.name {
            return subjectIndex
        }
        subjectIndex += 1.0
    }
    return -1.0
}
