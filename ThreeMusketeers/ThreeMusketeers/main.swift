//삼총사
import Foundation

//#1 완전탐색 3중포문
//3개를 더하면 0 -> 삼총사
//func solution(_ number:[Int]) -> Int {
//    var count = number.count
//    var a: Int
//    var result = 0
//    for p1 in 0..<count-2 {
//        for p2 in p1+1..<count-1{
//            for p3 in p2+1..<count{
//                a = number[p1] + number[p2] + number[p3]
//                if a==0 {
//                    result += 1
//                }
//            }
//        }
//    }
//    return result
//}

//#2 부분집합 활용
// 3개짜리 부분집합의 합 = 0 -> 삼총사
func solution(_ number:[Int]) -> Int {
    var result = 0
    var combintaions = myCombinateGenerater(number, size: 3)
    for combintaion in combintaions {
        var sum = 0
        for item in combintaion {
            sum += item
        }
        if sum == 0 {
            result += 1
        }
    }
    return result
}

print(solution([-2, 3, 0, 2, -5]))

func myCombinateGenerater(_ arr: [Int], size k : Int) -> [[Int]]{
    var allCombination: [[Int]] = arr.combinationsWithoutRepetition
    var result : [[Int]] = []
    for item in allCombination {
        if item.count == k {
            result.append(item)
        }
    }
    return result
}

extension Array {
    var combinationsWithoutRepetition: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).combinationsWithoutRepetition.flatMap { [$0, [self[0]] + $0] }
    }
}


// range 범위로 배열을 자르면 ArraySlice 타입으로 변함,
// Array(ArraySlice타입에 무언가) 로 형변환 필요
// Array.dropFirst(_ k:) k번째만큼 제외하고 ArraySlice 타입으로 반환
