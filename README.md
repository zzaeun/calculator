## Ch 2. 프로그래밍 기초 주차 과제

### 👩🏻‍🏫 프로젝트 소개

Swift를 활용해 계산기 만들기 (Swift5 사용)

--- 
### 프로젝트 기간
250819(화) ~ 250825 (월)

---
### 프로젝트 목적
`class`, `func`, `Optional` 등을 활용해 예외 처리 상황을 처리하며 간단한 계산기 코드를 구현할 수 있다.

---
## 최종 코드
```swift
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
```
---

# **Lv1**

#### - 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들기
#### - 생성한 클래스를 이용하여 연산을 진행하고 출력
#### - Code

    
```swift
    
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
    
        func div() -> Int {
            return num1 / num2
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

```
  
    

#### 💡 오류가 날 수 있는 ‘예외처리’ 상황에 대해 고민해보기

1. 0으로 나눌 경우 = '정의되지 않음'이 되어야 한다.
2. num1, num2 모두 Int로 정의했는데 실수를 계산하고, 값이 실수로 나와야하는 경우에는? (예: 나눗셈)
    - 계산기는 정수, 실수 모두 계산해줌 ( 정수 x 정수 = 정수, 정수 x 실수 = 실수, 실수 x 실수 = 실수)
3. 계산기는 몫과 나머지가 같이 있는 경우 몫.나머지로 알려주는데 코드로는 어떻게 해야할까? (Swift에서 나눗셈 => / : 몫, % : 나머지
 <br>  -> 몫, 나머지를 따로따로 구현해보자

<br>

### 보완) 퀵헬프 추가 및 나눗셈은 Double로 반환
퀵헬프 추가: `option` + `command` + `/` 

```swift

/// - Parameters:
/// - num1: 연산자의 왼쪽에 존재하는 수
/// - num2: 연산자의 오른쪽에 존재하는 수

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
```
- Double(num1)처럼 각각의 변수를 Double()로 해주어야 하는데 Double(num1 / num2)로 하려고 했어서 이상하게 나왔었다..ㅎㅎ 하지만 이제는 완벽하게 해결 완료 👍🏻


---

# **Lv2**

#### - Lv1에서 만든 Calculator 클래스에 “나머지 연산”이 가능하도록 코드를 추가하고, 연산 진행 후 출력
    - ex) 나머지 연산 예시 : 6을 3으로 나눈 나머지는 0 / 5를 3으로 나눈 나머지는 2
#### - 오류가 날 수 있는 ‘예외처리’ 상황에 대해 고민해보기 + 구현하기 (Lv1에서 고민한 '예외처리' 상황을 구현해보기)

#### 예외처리 상황

💡 1. 0으로 나눌 경우에는? '정의되지 않음'이 되어야 한다. ( num2 == 0 )
    
    → Optional을 사용해보자!
    

#### - Code
    
```swift
    
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
```
    
    

### ❓ `if let`, `guard let` 을 사용해서 Optional 처리는 어떻게 하지?

#### - Code
    
 ```swift
        // 나머지 연산
        func div1() {
            **if let** number = (num2 == 0 ? nil : num1 % num2) {
                print("\(number)")
            } else {
                print("정의할 수 없음")
            }
        }
    
        // 몫 연산
        func div2() {
            **guard let** number = (num2 == 0 ? nil : num1 / num2) else {
                print("정의할 수 없음")
                return
            }
            print("\(number)")
        }
  ```
<br>

#### 보완) `if let`, `guard let`을 활용해 0으로 나눌 경우를 Optional 처리

```swift
import Foundation

/// - Parameters:
/// - num1: 연산자의 왼쪽에 존재하는 수
/// - num2: 연산자의 오른쪽에 존재하는 수

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
    
    let calculator = Calculator(num1: 6, num2: 3)
    
    print(calculator.add())
    print(calculator.sub())
    calculator.div1()
    calculator.div2()
    print(calculator.mul())
```
- `%` 연산에서 `Double`로 어떻게 표현할 수 있을까 고민하던 중 팀원분의 코드 리뷰를 보면서 비슷한 문제를 겪고 해결한 내용을 봤다. `%` 연산자는 `Int`만 정의되어 있으므로 `Double` 타입으로 사용하려면 **`truncatingRemainder(dividingBy:)`** 메서드를 사용하면 해결할 수 있다는 것을 알게 되었다!! <br>
이를 적용하니 `%`에서 원하는 대로 Double로 출력이 되었고, `/`에서는 Lv1에서 수정한대로 변수들을 Double()로 묶어주니 해결되었다.
<br>

- `/` 연산에서 소수점 자리가 너무 많이 나와 지저분하게 느껴졌다. 깔끔하게 소수점 둘째자리까지 나오게 해야겠다! 라는 생각으로 인터넷을 찾아보니 **가장 가까운 정수로 반올림해주는 함수**인 `round`의 존재를 알게 되었다. 나는 소수점 둘째자리까지 나타나게 하는 것이 목표였기 때문에 `(number * 100) / 100`을 사용해 둘째자리까지 나타나게 작성해주었다!
  `round`를 사용하려면 `import Foundation`을 꼭!! 작성해주어야한다. 이것을 작성하지 않으면 에러가 발생한다..

---

# **Lv3**

#### - 아래 각각의 클래스들을 만들고 클래스간의 관계를 고려하여 Calculator 클래스와 관계 맺기
    AddOperation(더하기)
    SubstractOperation(빼기)
    MultiplyOperation(곱하기)
    DivideOperation(나누기)
#### - Calculator 클래스의 내부코드를 변경
    관계를 맺은 후 필요하다면 별도로 만든 연산 클래스의 인스턴스를 Calculator 내부에서 사용
#### - Lv2 와 비교하여 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
    hint. 클래스의 책임(단일책임원칙)

#### - 코드
  
```swift
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
        
        func remainder(_ num1: Int, _ num2: Int) -> Int? {
            return remainderOperation.remainder(num1, num2)
        }
        
        func quotient(_ num1: Int, _ num2: Int) -> Int? {
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
            if let number = (num2 == 0 ? nil : num1 % num2) {
                return number
            } else {
                return nil
            }
        }
    }
    
    class DivideOperation2 {
        // 몫
        func quotient(_ num1: Int, _ num2: Int) -> Int? {
            guard let number = (num2 == 0 ? nil : num1 / num2) else {
                return nil
            }
                return number
        }
        
    }
    
    let cal = Calculator()
    print(cal.add(5, 3))
    print(cal.sub(5, 3))
    print(cal.mul(5, 3))
    print(cal.remainder(6, 2))
    print(cal.quotient(8, 0))

```
  

    
#### - 💡 Lv2와 개선된 점

Lv2 코드에서는 `class Calculator`안에 `add`, `sub`, `multi`, `div` 함수가 모두 들어있어 **class Calculator가 4개의 연산 기능을 모두 담당**했다. 이는 **하나의 클래스는 하나의 기능을 담당하여 하나의 책임을 수행해야한다는 SRP**에 위반된다. 
    
그래서 Lv3에서는 각 연산 기능을 담당하는 `class`를 생성해 **각 class 가 하나의 기능을 담당**하도록 구현하였다.
    
각 `class`는 `class Calculator`에 `func`으로 들어가 해당 연산을 진행해야할 때 `func add()`를 실행하면 `AddOperation class`가 실행되어 `add` 연산을 수행한다.
    
즉 `Calculator`는 연산을 직접 연산하지 않고, **각 연산 클래스한테 일을 시키는 구조로 수정하였다.**


#### 보완) 
```swift
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
    
    func operate(_ operator: OperatorType, _ num1: Int, _ num2: Int) -> Int? {
        switch `operator` {
        case .add:
            return addOperation.add(num1, num2)
        case .sub:
            return substractOperation.sub(num1, num2)
        case .mul:
            return multiplyOperation.mul(num1, num2)
        case .remainder:
            if let result = remainderOperation.remainder(num1, num2) {
                return .double(result)
            } else { return nil }
        case .quotient:
            return quotientOperation.quotient(num1, num2)
        }
    }
}
```

- `operate`를 생성하고 switch 문으로 수정해보려했는데 switch문에서는 `.remainder`, `.quotient`만 `Double`로 반환하게 하는 것이 불가능했다. 그래서 결국 처음에 작성했던대로

```swift
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
print(cal.quotient(8, 5))
```
로 작성을 마무리했다. 몫, 나머지는 역시나 `-> Double?`로 작성해 소수로 반환되게 하였다.

---

# 단일 책임 원칙 (SRP: Single Responsibility Principle)

### 객체는 단 하나의 책임(기능)만 가져야 한다.

즉! **하나의 클래스는 하나의 기능을 담당하여 하나의 책임을 수행하는데 집중**

❓ 왜 필요할까

- **기능 변경(수정)이 일어났을 때** 한 객체에 책임이 많아질수록 클래스 내부에서 서로 다른 역할을 수행하는 코드끼리 강하게 결합될 가능성이 높아지게 됨 → 시스템 복잡
- But SRP를 적용하면 각 클래스 주제마다 책임 영역이 확실해짐 → 어떤 역할에 변경사항이 생기면 그 책임만 가지고 있는 클래스만 수정하면 끝

---
### 📝 개인 프로젝트를 마무리하며
이 프로젝트를 진행하며 처음엔 어떻게 시작을 해야할지 막막했다. 그러나 내가 구현해야하는게 무엇이고, 어떤 예외 상황을 생각해서 구현해야할지 차근차근 생각하고 문법을 학습하면서 '이렇게 구현하고 싶은데 이 문법을 사용해볼까?'하는 생각과 함께 일단 코드를 작성해보았다. 문제를 겪고 해결해나가면서 제대로 된 문법도 알아가고 자신감도 생기게 되었다. **문제를 보고 내 생각을 작성하면서 정리한 후 코드를 작성해가며 직접 부딪히는 방법**이 힘들지만 효과가 좋은 학습 방법이라고 생각했다.
기초 문법을 확실하게 알고 가는 것이 앞으로도 나에게 좋은 효과를 줄 것이라 생각하며 매일 TIL을 작성하며 복습하는 시간을 꼭꼭 가져야겠다! 이제 간단한 문법은 스스로 작성할 수 있어서 재미있는 프로젝트였다! 👍🏻
