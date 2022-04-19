import Swift
import CoreGraphics

// collection type

var integers : Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
// integers.append(10.1)

integers.contains(100)
integers.contains(10)
// integers.contains(100.1)

integers.remove(at: 1)
integers.removeLast()
integers.removeAll()

integers.count

// integers[-1]
// integers[0]



// various expression of array
// Array<Double> == [Double]

var doubles : Array<Double> = Array<Double>()
var strings : Array<String> = [String]()
var characteristics : [Character] = [Character]()
var bools : [Bool] = []

let immutableArray = [1, 2, 3]
// cannot use append or remove

// Dictionary

var anyDictionary : Dictionary<String, Any> = [String : Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary.removeValue(forKey: "someKey")
anyDictionary
anyDictionary["anotherKey"] = nil
anyDictionary

let emptyDict : [String : String] = [:]
// immortable

let immortableDict : [String : String] = ["colli" : "one", "soso" : "two"]
// let someValue : String = immortableDict["colli"]
// the value of key "colli" -> is uncertainty : exist or non


// Set : 집합
var integerSet : Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(11)
integerSet.insert(11)
integerSet.insert(11)

integerSet
integerSet.contains(100)
integerSet.contains(300)

integerSet.remove(100)
integerSet.removeFirst()
integerSet

integerSet.count


// application of Set
let SetA : Set<Int> = [3, 4, 5, 6, 7]
let SetB : Set<Int> = [5, 6, 7, 8, 9]

let union : Set<Int> = SetA.union(SetB)

let sortedUnion : [Int] = union.sorted()
 
let intersection : Set<Int> = SetA.intersection(SetB)

let subtracting : Set<Int> = SetA.subtracting(SetB)
