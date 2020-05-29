import UIKit

/*
    Advanced Operators
    Problem: Learn hot to create custom operators
*/


/*
    Inout
    Note: function paramters are constants by default
 */

func enterSomething(_ a: inout Int) {
    a += 1
    print(a)
}

var number = 10
enterSomething(&number)
print(number)

// Design Prefix and PostFix Operators

//: Prefix
!true
!false

prefix operator √
prefix func √(number: Double) -> Double {
    return sqrt(number)
}

√100
√900

prefix operator ‡
prefix func ‡(enterWord: String) -> String {
    return "\(enterWord): I am a christion"
}

let tradeMark = ‡"Samet iOS Developer"
print(tradeMark)

//: PostFix
// Ex)
let myName: String? = "Samet"
myName!

postfix operator «
postfix func «(value: String?) -> String {
  guard let unwrappedValue = value else {
        return ""
    }
    return "My nickname is \(unwrappedValue)"
}

let myNickName: String? = "Sam"
print(myNickName«)


postfix operator ∑
postfix func ∑(number: Int) -> String {
    return number % 2 == 0 ? "Even" : "Odd"
}

100∑
Int(arc4random())∑


//: ### Infix
3 * 3 + 4

//: > Swift 3.0
precedencegroup CustomOperatorPrecedence {
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    associativity: left
}

infix operator ????: CustomOperatorPrecedence
// Random Number Generation
func ???? (left: UInt32, right: UInt32) -> Double {
    let lower: UInt32 = left
    let upper: UInt32 = right
    let randomNumber = arc4random_uniform(upper - lower) + lower
    return Double(randomNumber)
}

1 ???? 3
1 ???? 12

func findRandomNumber(from lower: Double, to uper: Double) -> Double {
    return Double()
}

findRandomNumber(from: 0, to: 10)


//: Overloading

// "a" * 10
// "aaaaaaaaa"

func * (left: String, right: Int) -> String {
    guard right >= 0 else {
        print("Make sure enter number higher 0")
        return ""
    }
    
    var result = String()
    for _ in 1..<right {
        result += left
    }
    
    return result
}


"a" * 10


// [1, 2] + [3, 4] --> [4.0, 6.0]
func +(left: [Double], right: [Double]) -> [Double] {
    var sum = [Double](repeating: 0.0, count: left.count)
    
    print(left.enumerated())
    for (i, _) in left.enumerated() {
        sum[i] = left[i] + right[i]
    }
    
    return sum
}


[1, 2] + [3, 4]
