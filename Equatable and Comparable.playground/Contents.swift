import UIKit

/*
    Equatable and Comparable
    Problem: Understand, "Swift is a protocol oriented language"
 */

5 == 5

"Samet " == "Samet"

// Equatable

// func ==(lhs: Self, rhs: Self) -> Bool

//: Custom Struct
struct Blog {
    let author: String
    let title: String
}

extension Blog: Equatable {
    static func ==(lhs: Blog, rhs: Blog) -> Bool {
        return lhs.author == rhs.author && lhs.title == rhs.title
    }
}

Blog(author: "Samet", title: "Swift") == Blog(author: "Samet", title: "Swift")


//: Custom Tuple
struct GridPoint {
    var grid: (Int, Int)
    init(_ numberOne: Int, _ numberSecond: Int) {
        self.grid = (numberOne, numberSecond)
    }
}

extension GridPoint: Equatable {
    static func ==(lhs: GridPoint, rhs: GridPoint) -> Bool {
        return lhs.grid.0 == rhs.grid.0 && rhs.grid.1 == rhs.grid.1
    }
}

let pointOne = GridPoint(5, 10)
let pointSecond = GridPoint(5, 11)

pointOne == pointSecond // true

// Examples
100 > 5 // true
10 <= 4 // false
123.1 >= 100.0 // true

/*
 public protocol Comparable: Equatable {
     static func <(lhs: Self, rhs: Self) -> Bool
     static func <=(lhs: Self, rhs: Self) -> Bool
     static func >=(lhs: Self, rhs: Self) -> Bool
     static func >(lhs: Self, rhs: Self) -> Bool
 }
*/

enum OS {
    case iOS
    case android
}

extension OS: Comparable {
    static func ==(lhs: OS, rhs: OS) -> Bool {
        return lhs == rhs
    }
    static func <(lhs: OS, rhs: OS) -> Bool {
        return rhs == .iOS ? true : false
    }
    static func <=(lhs: OS, rhs: OS) -> Bool {
        return lhs.self == .iOS && rhs.self == .android
    }
    static func >=(lhs: OS, rhs: OS) -> Bool {
        return false
    }
    static func >(lhs: OS, rhs: OS) -> Bool {
        return false
    }
}

OS.iOS > OS.android

