import UIKit

/*
    Nested Generics and Recursive Enum
    Problem:
     1- Learn how to create nested generic enum
     2- Learn more about recursive enum with binary tree
 */


//: ### Nested Generics
//: Before Swift 3.1

//: Design Generic Enums
enum Gadget<T> {
    case smartphone
    case laptop
    case fridge
    case others(T)
}

enum Company<T> {
    case Samsung
    case Apple
    case Sony
    case others(T)
}

// Design Struct
struct Product<T> {
    let company: Company<T>
    let gadget: Gadget<T>
    let reviews: [T]
    
    init(company: Company<T>, gadget: Gadget<T>, reviews: [T]) {
        self.company = company
        self.gadget = gadget
        self.reviews = reviews
    }
}

let myProduct = Product(company: .Apple, gadget: .fridge, reviews: ["Good, silver, but expensive"])


//: Swift 3.1
struct Team<T> {
    struct TeamMember {
        let name: T?
        let age: T?
    }
}


struct NestedProduct<T> {
   indirect enum Gadget {
        case smartphone
        case laptop
        case fridge
        case others(T)
    }
    
   indirect enum Company {
        case Samsung
        case Apple
        case Sony
        case others(T)
    }
    
    let company: Company
    let gadget: Gadget
    let reviews: [T]
    
    init(company: Company, gadget: Gadget, reviews: [T]) {
        self.company = company
        self.gadget = gadget
        self.reviews = reviews
    }
}

let myFridge = NestedProduct(company: .Apple, gadget: .laptop, reviews: ["Good"])


/*
  Note
  Cyclic Dependency: A relation between two or more modules which either directly or indirectly
        depend on each other to function properly. The tight coupling of the mutually dependent
        modules which reduces or makes impossible the separate re-use of a single module.
 */


//: ### Recursive Enum
//: Reference vs Value Type in Associated Value
class SametClass {}
struct SametStruct {}
enum SametEnum {
    case sametCase
}

let sametClass = SametClass()
let sametStruct = SametStruct()
let sametEnum = SametEnum.sametCase

enum RealEnum {
    case myClass(SametClass)
    case myStruct(SametStruct)
    case myEnum(SametEnum)
}

RealEnum.myClass(sametClass)
RealEnum.myStruct(sametStruct)
RealEnum.myEnum(sametEnum)

//: The Meaning of indirect enum with Binary Tree
indirect enum Tree {
    case Empty
    case Node(value: Int, left: Tree, right: Tree)
}

let tree1 = Tree.Node(value: 1, left: .Empty, right: .Empty)
let tree2 = Tree.Node(value: 2, left: .Empty, right: .Empty)
let tree3 = Tree.Node(value: 3, left: tree1, right: tree2)
let tree4 = Tree.Node(value: 4, left: tree3, right: .Empty)
    
//: Recursive Function to Sum Values
func evaluateTree(tree: Tree) -> Int {
    switch tree {
    case .Empty:
        return 0
    case .Node(value: let value, left: let left, right: let right):
        return value + evaluateTree(tree: left) + evaluateTree(tree: right)
    }
}

evaluateTree(tree: tree1) // 1
evaluateTree(tree: tree2) // 2
evaluateTree(tree: tree3) // 6

/*
    Important: Enum that is an associate value has all the value within single object but indirect,
               reference pointing at each other.
 */




