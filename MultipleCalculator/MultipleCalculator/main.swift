//프로그래머스 문제는 아님... 숫자연산자를 여러개 포함한 스트링을 계산하는 다중계산 구현하기


import Foundation

// 숫자, 연산자 나누는 함수
func seperateString(_ str: String) -> [String] {
    var result: [String] = []
    var record : String = ""
    for x in str {
        if x.isDouble{
            record += String(x)
        }else{
            result.append(record)
            result.append(String(x))
            record = ""
        }
    }
    if record != "" {
        result.append(record)
    }

    return result
}

func solution(_ str: String) -> Double {
    let arr = seperateString(str)
    var numStack: [String] = []
    var operStack: [String] = []

    // 숫자는 무조건 넘스택에 푸쉬
    // 오퍼스택에 무조건 푸쉬
    // 오퍼스택 탑에 */를 발견
    // * / 발견하면 숫자스택에서 팝을 두번
    // 오퍼스택 팝 한번
    // 연산
    // 결과를 넘스택에 푸쉬
    
    var x = 0.0
    var y = 0.0
    var oper = ""
    
    for string in arr {
        
        if string.isNumber {
            numStack.append(string)
            if operStack.last == "*" || operStack.last == "/" {
                y = Double(numStack.removeLast())!
                x = Double(numStack.removeLast())!
                oper = operStack.removeLast()
                numStack.append( oper == "*" ? String(x*y) : String(x/y))
            }
        } else {
            operStack.append(string)
        }
        
    }
    print(numStack)
    print(operStack)
    
    while !operStack.isEmpty {
        x = Double(numStack.removeFirst())!
        y = Double(numStack.removeFirst())!
        oper = operStack.removeFirst()
        numStack.insert(oper == "+" ? String(x+y) : String(x-y), at: 0)

        }
        //print(numStack)
        //print(operStack)

        return Double(numStack.last!)!
}

print(solution("1.1-5*3.1+1-2*0.1"))//-13.6

extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789.")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}

extension Character {
    var isDouble: Bool {
        self.isNumber || self == "."
    }
}
