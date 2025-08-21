
class Calculator {

    var num1: Int
    var num2: Int
    
    init(num1: Int, num2: Int) {
        self.num1 = num1
        self.num2 = num2
    }
    
    func add() -> Int {
        return num1 + num2
    }
    
    func sub() -> Int {
        return num1 - num2
    }
    
    // 나머지 연산
    func div1() -> Int? {
        if num2 == 0 { return nil }
        return num1 % num2
    }

    // 몫 연산
    func div2() -> Int? {
        if num2 == 0 { return nil }
        return num1 / num2
    }
    
    func mul() -> Int {
        return num1 * num2
    }
}

let calculator = Calculator(num1: 6, num2: 3)

print(calculator.add())
print(calculator.sub())
print(calculator.div1())
print(calculator.div2())
print(calculator.mul())
