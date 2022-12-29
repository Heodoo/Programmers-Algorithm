import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var answer = 0
    var check : [Int] = Array(repeating: 1, count: n)
    for l in lost {
        check[l-1] = 0
    }
    for r in reserve {
        check[r-1] += 1
    }
    for i in 0..<n-1 {
        if check[i] == 2 && check[i+1] == 0 {
            check[i] = 1
            check[i+1] = 1
        }else if check[i+1] == 2 && check[i] == 0 {
            check[i] = 1
            check[i+1] = 1
        }
    }
    for c in check {
        if c > 0 {
            answer += 1
        }
    }
    return answer
}

//[2,0,2,0,2]
