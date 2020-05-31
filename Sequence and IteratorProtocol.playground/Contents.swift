import UIKit

/*
    Sequence and IteratorProtocol
    Problem: What goes under the hood of a for-in loop.
 */

// What we take it for granted
let iOSSkills = ["Swift", "UIKit", "RxSwift", "TDD"]
for skill in iOSSkills {
    print(skill)
}

for character in "Samet the iOS Developer" {
    //print(character)
}

//: Behind the scene
var skillIterator = iOSSkills.makeIterator()
while let skill = skillIterator.next() {
    print(skill)
}

let numbers = [2, 3, 5, 7]
var numbersIterator = numbers.makeIterator()

numbersIterator.next()
numbersIterator.next()
numbersIterator.next()
numbersIterator.next()
numbersIterator.next()
numbersIterator.next()

struct MyCountdown: Sequence {
    let start: Int
    
    func makeIterator() -> CountDownIterator {
        CountDownIterator(self)
    }
}

//: IteratorProtocol
struct CountDownIterator: IteratorProtocol {
    let countdown: MyCountdown
    var times = 0
    init(_ countdown: MyCountdown) {
        self.countdown = countdown
    }
    
    mutating func next() -> Int? {
        let nextNumber = countdown.start - times
        guard nextNumber > 0 else { return nil }
        times += 1
        return nextNumber
    }
}

//: Testing
var threeTwoOne = MyCountdown(start: 3)
var iterator = threeTwoOne.makeIterator()
iterator.next()
iterator.next()
iterator.next()
iterator.next()

// Magic

for count in threeTwoOne {
    print("\(count)...")
}

print("hello")
print(123)
print(true)
