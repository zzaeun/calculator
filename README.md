## Ch 2. 프로그래밍 기초 주차 과제

### 👩🏻‍🏫 프로젝트 소개

Swift를 활용해 계산기 만들기 (Swift5 사용)
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
    

---

# 단일 책임 원칙 (SRP: Single Responsibility Principle)

### 객체는 단 하나의 책임(기능)만 가져야 한다.

즉! **하나의 클래스는 하나의 기능을 담당하여 하나의 책임을 수행하는데 집중**

❓ 왜 필요할까

- **기능 변경(수정)이 일어났을 때** 한 객체에 책임이 많아질수록 클래스 내부에서 서로 다른 역할을 수행하는 코드끼리 강하게 결합될 가능성이 높아지게 됨 → 시스템 복잡
- But SRP를 적용하면 각 클래스 주제마다 책임 영역이 확실해짐 → 어떤 역할에 변경사항이 생기면 그 책임만 가지고 있는 클래스만 수정하면 끝
