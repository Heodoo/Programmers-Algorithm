//lv3 하노이타워 (재귀식만 찾으면 쉬운데..., 점화식 생각하기가 쉽지 않음)

import Foundation
var result: [[Int]] = []
func solution(_ n:Int) -> [[Int]] {
    hanoi(n, 1, 3, 2)
    return result
}
//hanoi(n,start,end,via) =
//hanoi(n-1,start,via,end) + move(n,start,end)+ hanoi(n-1,via,end,start)
func hanoi(_ n:Int,_ start:Int,_ end:Int,_ via:Int){
    if n==1 {
        move(1,start,end)
    }
    else {
        hanoi(n-1,start, via, end)
        move(n,start,end)
        hanoi(n-1, via, end, start)
    }
    
}
func move(_ n:Int,_ start:Int,_ end:Int){
    result.append([start,end])
}

//struct Stack<T> {
//    private var data : [T] = []{
//        didSet {
//            isEmpty = data.isEmpty
//            top = data.last
//        }
//    }
//    var isEmpty : Bool = true
//    var top : T?
//
//
//    mutating func push(_ item: T) {
//        data.append(item)
//    }
//
//    mutating func pop()->T {
//        return data.removeLast()
//    }
//
//
//}



print(solution(2))



