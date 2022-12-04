//
//  main.swift
//  Carpet
//
//  Created by MacBook on 2022/11/30.
//
/*
 brown은 8 이상 5,000 이하
 yellow는 1 이상 2,000,000 이하
 카펫의 가로 길이 >= 세로 길이

 */
import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var answer: [Int] = [0,0]
    var height = 0
    var width = yellow
    while height <= width {
        height += 1
        if yellow % height != 0 {
            continue
        }else{
            width = yellow / height
        }
        if brown == width*2 + height*2 + 4 {
                answer[0] = width + 2
                answer[1] = height + 2
            break
        }
    }
    return answer
}

print(
solution(10, 2)
)
