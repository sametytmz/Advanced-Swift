import UIKit

/*
    Test Driven Swift
    Problem: Learn how to create safe apps
 */

for _ in 1...10000 {
    //print("hello")
}

// Test Driven Development

/*
    - Onone       // speed: slow usage: debug
    - O           // speed: fast usage: release
    - Ounchecked  // speed: super fast usage: testing
 */

/*
 Note: Creating swift file you should enter this command on terminal
        --> "touch example.swift"
        Trying for test you should enter this command
        --> "xcrun swiftc -O example.swift -o executable"
 */

/*
    Assert Function
    -> assert()
    -> assertionFailure()
    -> precondition()
    -> preconditionFailure()
    -> fatalError()
 */

func enterName(name: String) {
    if name.isEmpty {
        assert(false, "You must enter a full valid name")
    } else if name == "Sam" {
        assert(false, "You can't use Sam")
    } else {
        assert(true)
    }
}

enterName(name: "Samet")

var expectedResult = 10
var actualResult = 10

// Assertion
assert(expectedResult == actualResult, "The actual result doesn't match with the expected")

// AssertionFailure
let randomNumber: Int = Int(arc4random_uniform(6))

switch randomNumber {
case 0, 1, 2:
    print(randomNumber)
default:
    assertionFailure("Unexpected index \(randomNumber)")
}

// Precondition
let expectedNumber = (1, 3)
let actualNumber = (1, 3)

precondition(expectedNumber == actualNumber, "\(actualNumber) in not the same as \(expectedNumber)")

// FatalError
let number: Int = Int(arc4random_uniform(100))
func enterNumberReturnString(index: Int) -> String {
    switch index {
    case 0, 1, 2:
        return "\(number)"
    default:
//        assertionFailure("Unexpected index \(number)")
//        abort()
        fatalError("Unexpected index \(number)")
    }
}

enterNumberReturnString(index: number)
