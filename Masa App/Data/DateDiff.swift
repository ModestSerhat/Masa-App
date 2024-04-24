import Foundation

func getDateDifferenceTextFromNow(to endDate: Date) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .full
    formatter.includesApproximationPhrase = false
    formatter.includesTimeRemainingPhrase = false
    formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
    formatter.maximumUnitCount = 1
    
    guard let formattedString = formatter.string(from: Date(), to: endDate) else {
        return ""
    }
    
    // Append the unit label manually based on the largest non-zero unit
    let components = formattedString.components(separatedBy: " ")
    let unit = components[1]
    let value = components[0]
    return "\(value) \(unit)"
}
