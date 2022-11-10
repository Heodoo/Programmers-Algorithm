//
//  main.swift
//  TwoOtherBit
//
//  Created by 허두영 on 2022/11/08.
//
//f(2) =3 f(7) = 11
//1,2개 다른 비트중 자신 보다 크지만 그중 가장 작은 수
//0010 - > 0011 0111 -> 1111
// 0001 -> 0011 [0,1,0,1] -> [0,1,1,0] k=0 n>>1 n%2==0
//1110
//111 11 1 0 k = 3
//111 1111
// n%2 == 1 ->
import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var result: [Int64] = []
    
    //pow(3.0, 2) //9.0
    // 1011
    for number in numbers {
        var fx = number
        var k = 0
        while fx > 0 {
            if fx%2 == 0 {
                break
            }
            fx = fx>>1
            k += 1
        }
        if k == 0 {
            result.append(number+1)
        }else {
            result.append(number + Int64(truncating: pow(2.0,k) as NSNumber) - Int64(truncating: pow(2.0,k-1) as NSNumber))
        }
    }
    
    return result
}
print(solution([2,7]))
