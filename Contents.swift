import Foundation

class AddOperation {
    func add(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
    }
}

class SubstractOperation {
    func sub(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }
}

class MultiplyOperation {
    func mul(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }
}

class DivideOperation1 {
    // 나머지
    func remainder(_ num1: Int, _ num2: Int) -> Double? {
        if let number = (num2 == 0 ? nil : Double(num1).truncatingRemainder(dividingBy: Double(num2))) {
            return number
        } else {
            return nil
        }
    }
}

class DivideOperation2 {
    // 몫
    func quotient(_ num1: Int, _ num2: Int) -> Double? {
        guard let number = (num2 == 0 ? nil : Double(num1) / Double(num2)) else {
            return nil
        }
        let rounded = round(number * 100) / 100
        return rounded
    }
}

enum OperatorType {
    case add
    case sub
    case mul
    case remainder
    case quotient
}


/// - Parameters:
/// - num1: 연산자의 왼쪽에 존재하는 수
/// - num2: 연산자의 오른쪽에 존재하는 수

class Calculator {
    let addOperation = AddOperation()
    let substractOperation = SubstractOperation()
    let multiplyOperation = MultiplyOperation()
    let remainderOperation = DivideOperation1()
    let quotientOperation = DivideOperation2()
    
    func add(_ num1: Int, _ num2: Int) -> Int {
        return addOperation.add(num1, num2)
    }
    
    func sub(_ num1: Int, _ num2: Int) -> Int {
        return substractOperation.sub(num1, num2)
    }
    
    func mul(_ num1: Int, _ num2: Int) -> Int {
        return multiplyOperation.mul(num1, num2)
    }
    
    func remainder(_ num1: Int, _ num2: Int) -> Double? {
        return remainderOperation.remainder(num1, num2)
    }
    
    func quotient(_ num1: Int, _ num2: Int) -> Double? {
        return quotientOperation.quotient(num1, num2)
    }
}

enum CalculationResult {
    case int(Int)
    case double(Double)
}

let cal = Calculator()

print(cal.add(5, 3))
print(cal.sub(5, 3))
print(cal.mul(5, 3))
print(cal.remainder(5, 2))
print(cal.quotient(8, 3))
