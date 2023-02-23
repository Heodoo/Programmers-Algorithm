//
//  main.swift
//  Cut2DArray
//
//  Created by MacBook on 2022/12/14.
//

import Foundation
//방법 1 45.0/100
func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var answer : [Int] = []
    var arr = [[Int]](repeating: Array(repeating: 0, count: n), count: n)
    
    for y in 1...n {
        for x in 1...n{
            arr[y-1][x-1] = x > y ? x : y
        }
    }
    var arr1d : [Int] = []
    arr.map {
        arr1d += $0
    }
    answer = Array(arr1d[Int(left)...Int(right)])
    return answer
}
//방법2
func solution2(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var answer : [Int] = []
    var arr = [Int](repeating: 0, count: n*n+1)
    
    for i in 0..<n {
        for j in 0..<n{
            if i > j {
                arr[i*n+j] = i+1
            }else{
                arr[i*n+j] = j + 1
            }
        }
    }
    
    answer = Array(arr[Int(left)...Int(right)])
    return answer
}

//방법3
func solution3(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var answer : [Int] = []
    
    //var len = right - left
    //q 몫 r 나머지
    var lq = Int(left) / n
    var lr = Int(left) % n
    var rq = Int(right) / n
    let rr = Int(right) % n
    
    while n*lq + lr <= n*rq + rr {
        if lr >= n {
            lr = 0
            lq += 1
        }
        if lq > lr {
            answer.append(lq+1)
        }else{
            answer.append(lr+1)
        }
        lr += 1
    }
    return answer
}


//[3,2,2,3]
print(solution3(3, 2, 5))
//4    7    14    [4,3,3,3,4,4,4,4]

// left %n

//1...n
//2,2,...n
//3,3,3...n
//nn,nnnnnn
//n*n
// 그중 left right
//

/*
 1 2 3 223 333
 2 2 3
 3 3 3
 */
