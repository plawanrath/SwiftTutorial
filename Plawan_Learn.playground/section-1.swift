
var str = "Hello World"
str   // This simply prints it

var str1:String = "Cool"

println("Hey that's nice")  // println can also be used
let myConst = 15   // let is used to define constants
myConst

let checkDub:Double = 12.5
let chkF:Float = 4

var sum = Double(myConst) + checkDub //explicit type casting a mandatory
sum
var an = 12
let text = "This is a sample "
let newText = text + String(an) //This is not possible with floating point numbers

let textF = "Another sample \(chkF) text" //Floats can be added to strings this way


var arr1 = ["Hi","Hello","This","is","Good"]    //Array
println(arr1[2])

var dict1 = [                                       //Dictionary
            "Plawan": "Rath",
            "Donald": "Trump",
            "Santosh": "Singh",
            "Nghia": "Phan",
            ]
dict1["Santosh"]


let scores = [12, 13, 23, 20, 45]
var total = 0    //Any var needs to be either initialized or needs type specified

for x in scores {
    total = total + x
}

total

var optionalVal: String? = "Hello" // Use ? to say some string is optional
println(optionalVal)

var optionlN: String? = "Plawan"

//optionlN = nil

var greeting = "Hello!"
//using if-let with optional values.. if name gets a value then go into if condition
if let name = optionlN {
    greeting = "Hello, \(optionlN)"
}

let veggie = "red pepper"  //Example of switch variations
switch veggie {
    case "Flower": let comment = "Its a flower"
    case "Friut": let comment = "Its a fruit"
    case "tomato","potato": let comment = "Its a veggetable"
case let x where x.hasSuffix("pepper"):
    let comment = "Its a spicy \(x)"
default: let comment = "Please give valid choice"
}
//Defualt needs to be there 

//using for-in with a dictionary

let someNums = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = [Int]()   // **** IMPORTANT Appending Arrays
var i = 0
for (kind, numbers) in someNums {
    var large = 0
    for number in numbers {
        if number > large {
            large = number
        }
    }
    largest.insert(large, atIndex: i)
    i = i+1
}
var sum1 = 0
for x in largest {
    sum1 = sum1 + x
}
sum1

//similarly can use while and do-while

// a different kind of for-in loop
var s1 = 0
for i in 0..<4 {    //This is same as for i=0; i<4; i++
    s1 = s1 + i
}
s1

//FUnctions

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Plawan","Saturday")

func lunch_spe(name: String, lunch: String) -> String {
    return "Hey \(name) today we have \(lunch) for you."
}
lunch_spe("Plawan","Baggles")

//Return multiple values from a function

func calStat(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        }
        else if score < min {
            min = score
        }
        sum = sum + score
    }
    return (min, max, sum)
}
var mysc = calStat([5, 12, 15, 20, 50])
mysc.sum


//Another way of taking multiple number of arguments in function
func sumOF(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOF()
sumOF(12, 14, 20, 30)

//Nested Functions

func returnFifteen() -> Int {
    var y = 10 //Nested functions have access to variables declared in outer func
    func add() {
        y += 5
    }
    add()
    return y
}

// Functions returning functions
func returnFif() -> Int {
    var y:Int = 10
    func add() -> Int {
        return y + 5
    }
    return add()
}
returnFif()

//Functions taking another function as arguments

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var mylist = [10, 8, 12, 22, 45, 3]
hasAnyMatches(mylist, lessThanTen)

// Closures can be written using ({}) used with a list using map function
var numbers = [10, 8, 12, 22]
numbers.map({
    (number: Int) -> Int in
    let res = 4 * number
    return res
})

// Using $ notations in Swift
let sortedNums = sorted(numbers) { $0 > $1 }
sortedNums

//Classes and Objects

class shape {
    var nos = 0
    let myconst = 12
    func simpleDesc() -> String {
        return "A figure with \(nos) sides"
    }
    func foo(assign: Int) -> Int {
        return assign * 2
    }
}

var s11 = shape()
s11.nos = 6
s11.simpleDesc()
var result = s11.foo(4)
result

//initializer for the class NOTICE HOW INIT IS CALLED

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape \(name) with \(numberOfSides) sides"
    }
}

var nsh = NamedShape(name: "Square")
nsh.numberOfSides = 4
nsh.simpleDescription()

//Inheritence and method overriding *** Using override keyword is mandatory or error

class Square: NamedShape {
    var len: Double
    
    init(len: Double, name: String) {
        self.len = len
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return len * len
    }
    override func simpleDescription() -> String {
        return "Square with sides of length \(len) and area \(self.area())."
    }
}

let t11 = Square(len: 5.2, name: "My Square")
t11.area()
t11.simpleDescription()
// Notice function called inside the class above in the overidden function

//Classes with setter and getter

class EquiTri: NamedShape {
    var slen: Double
    
    init(slen: Double, name: String) {
        self.slen = slen
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * slen
        }
        set {
            slen = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "We got a triangle of lengths \(slen)."
    }
}

var tr1 = EquiTri(slen: 3.1, name: "My Triangle")
tr1.perimeter        // called the getter
tr1.perimeter = 9.9    // called the setter to set the new length of sides
tr1.simpleDescription()

//Enumerations

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King     // Here we are defining what can be the various cases of this enum
    func desc() -> String {
        switch self {
        case .Ace: return "ace"
        case .Jack: return "jack"
        case .Queen: return "queen"
        case .King: return "king"
        default: return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceVal = ace.rawValue
let tt = Rank.Two
let tVal = tt.rawValue

enum Suit { //Notice default not needed here since all cases of enum are defined
    case Spades, Hearts, Diamonds, Clubs
    func simDesc() -> String {
        switch self {
        case .Spades: return "spades"
        case .Hearts: return "hearts"
        case .Diamonds: return "diamonds"
        case .Clubs: return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let hdesc = hearts.simDesc()

//Structures. Diffierence with classes is structs are always copied whrn they are passed around, but classes are passed by reference

struct Card {
    var rank: Rank
    var suit: Suit
    func cardDesc() -> String {
        return "The \(rank.desc()) of \(suit.simDesc())."
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let finVal = threeOfSpades.cardDesc()
