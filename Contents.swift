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
    
    func div1(_ num1: Int, _ num2: Int) -> Int? {
        return remainderOperation.remainder(num1, num2)
    }
    
    func div2(_ num1: Int, _ num2: Int) -> Int? {
        return quotientOperation.quotient(num1, num2)
    }
}

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
    func remainder(_ num1: Int, _ num2: Int) -> Int? {
        guard num2 != 0 else { return nil }
        return num1 % num2
    }
}

class DivideOperation2 {
    // 몫
    func quotient(_ num1: Int, _ num2: Int) -> Int? {
        guard num2 != 0 else { return nil }
        return num1 / num2
    }
    
}

let cal = Calculator()
print(cal.add(5, 3))
print(cal.sub(5, 3))
print(cal.mul(5, 3))
print(cal.div1(5, 3))
print(cal.div2(5, 3))
