//: Playground - noun: a place where people can play

import UIKit

extension UIColor {
    static var favoriteColor: UIColor {
        return UIColor(red: 0.5, green: 0.1, blue: 0.5, alpha: 1.0)
    }
}

extension String {
    mutating func pluralized() {
        // Complex code that takes the current value (self) and converts it to the plural version
    }
}

var apple = "Apple"
print(apple.pluralized())

struct Employee {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
}

extension Employee: Equatable {
    static func ==(lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName ==
            rhs.lastName && lhs.jobTitle == rhs.jobTitle &&
            lhs.phoneNumber == rhs.phoneNumber
    }
}


