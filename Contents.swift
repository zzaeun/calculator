
/// - Parameters:
/// - num1: 연산자의 왼쪽에 존재하는 수
/// - num2: 연산자의 오른쪽에 존재하는 수
///
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
    
        func div() -> Double {
            return Double(num1) / Double(num2)
        }
    
        func mul() -> Int {
            return num1 * num2
        }
    }
    
    let calculator = Calculator(num1: 3, num2: 8)
    print(calculator.add())
    print(calculator.sub())
    print(calculator.div())
    print(calculator.mul())
