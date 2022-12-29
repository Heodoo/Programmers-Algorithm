import Foundation

func solution(_ food:[Int]) -> String {
    var answer = ""
    for i in 1..<food.count {
        let tmp = food[i]/2
        for _ in 0..<tmp {
            answer += String(i)
        }
    }
    answer = answer + "0" + String(answer.reversed())
    return answer
}


print(solution([1,3,4,6]))
//result = "1223330333221"
