import MediaPlayer

let startTime = CACurrentMediaTime()

for i in 1...1000000 {
    print(i)
}

let totalTime = CACurrentMediaTime() - startTime
let sum = "time - \(totalTime) sec"
print("Total: \(sum)")
