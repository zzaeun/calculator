import Foundation

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
          func div1() {
              if let number = (num2 == 0 ? nil : Double(num1).truncatingRemainder(dividingBy: Double(num2))) {
                  print("\(number)")
              } else {
                  print("정의할 수 없음")
              }
          }
      
          // 몫 연산
          func div2() {
              guard let number = (num2 == 0 ? nil : Double(num1) / Double(num2)) else {
                  print("정의할 수 없음")
                  return
              }
              let rounded = round(number * 100) / 100
              print(rounded)
          }
        
        func mul() -> Int {
            return num1 * num2
        }
    }
    
    let calculator = Calculator(num1: 9, num2: 3)
    
    print(calculator.add())
    print(calculator.sub())
    calculator.div1()
    calculator.div2()
    print(calculator.mul())
