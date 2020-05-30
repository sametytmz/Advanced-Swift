import UIKit

/*
    Advanced Error Handling
    Problem: What is rethrow?
 */

Array<String>()

//: Design error Case
enum TestingError: Error {
    case randomError
    case randomEmpty
}


//: Design Functions
func nonThrowableFunc() {
    print("From nonThrowable function")
    //throw TestingError.randomEmpty
}

func throwableFunc() throws {
    print("From throwable function")
    throw TestingError.randomError
}

func reThrowableFuncWithErrorHandling(closure: () throws -> ()) rethrows {
    do {
        try closure()
    } catch TestingError.randomError {
        print("Random error thrown by the closure")
    } catch {
        fatalError("Fatal Error")
    }
}


//: Enter throwable function
try? reThrowableFuncWithErrorHandling(closure: throwableFunc)
reThrowableFuncWithErrorHandling(closure: nonThrowableFunc)
