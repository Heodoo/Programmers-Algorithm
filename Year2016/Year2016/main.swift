//
//  main.swift
//  Year2016
//
//  Created by MacBook on 2022/12/20.
//

import Foundation
// 31 29 31 30 31 30 31 31 30 31 31
// SUN,MON,TUE,WED,THU,FRI,SAT
// 2016년 1월 1일은 금요일

func solution(_ a:Int, _ b:Int) -> String {
    var day = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    //print(31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 31)
    var days = 0
    if a == 1{
        return day[(days+b+4)%7]
    }else{
        for i in 1...a-1 {
            if i%2 == 0 {
                if i == 2 {
                    days += 29
                }else {
                    days += 30
                }
            }else{
                days += 31
            }
        }
    }
    return day[(days+b+4)%7]
}


//"TUE"
print(solution(5, 24))
