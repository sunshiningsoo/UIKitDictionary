import Cocoa

func calculate(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

func add(no1: Int, no2: Int) -> Int {
    return no1 + no2
}

calculate(a: 2, b: 3, operation: add)


func multiple(no1: Int, no2: Int) -> Int {
    return no1 * no2
}

calculate(a: 2, b: 3, operation: multiple)

//MARK: - 클로저의 축약되는 과정
//{ (no1: Int, no2: Int) -> Int in
//    return no1 * no2
//}
//
//
//{ (no1, no2) -> Int in
//    return no1 * no2
//}
//
//
//{ (no1, no2) in no1 * no2 }
//
//{ ($0, $1) in $0 * $1 }
//
//{ $0 * $1 }

//MARK: - 실제 축약하며 사용
calculate(a: 2, b: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
})

calculate(a: 2, b: 3, operation: { (no1, no2) -> Int in
    return no1 * no2
})

calculate(a: 2, b: 3, operation: { (no1, no2) in no1 * no2 })

calculate(a: 2, b: 3, operation: { $0 * $1 })

calculate(a: 2, b: 3) { $0 * $1 }
