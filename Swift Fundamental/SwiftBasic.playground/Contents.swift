import UIKit

var str = "Hello, playground"

// type Inference and casting
let wantDouble = 3
let tobeDouble = Double(3)
let tobeDouble2: Double = 3
let tobeDouble3 = 3 as Double

// string
let myString = "css has very no fun.."
let koreanString = "나랏말쌈이 듕국에 달아"

 /* swift use Unicode thier standard*/
var sum = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
    if row == column {
      continue rowLoop
    }
    sum += row * column
  }
}

