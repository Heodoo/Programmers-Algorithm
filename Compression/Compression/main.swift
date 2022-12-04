//
//  main.swift
//  Compression
//
//  Created by MacBook on 2022/11/23.
//

import Foundation

/*
 kakao
 k 11
 ka 1
 ak 11
 
 */
func solution(_ msg:String) -> [Int] {
    var result : [Int] = []
    var xs = (97...122).map({String(UnicodeScalar($0)).uppercased()})
    var num = Array((1...26))
    
    var dict: [String:Int] = [:]
    for i in 0..<xs.count {
        dict[xs[i]] = num[i]
    }
    var k = 26
    var w = 0
    //var arr = Array(msg.map({String($0)})
    var arr = Array(msg)
    while w < msg.count {
        var i = 0
        while true {
            if w+i < msg.count && dict.keys.contains(String(arr[w...w+i])){
                //w->o
                //kakao ka ak
                i+=1
            }else{
                if w+i < msg.count {
                    k+=1
                    dict[String(arr[w...w+i])] = k
                }
                break;
            }
        }
        if let a = dict[String(arr[w...w+i-1])] {
            result.append(a)
        }
        w+=i
    }
    print(dict.keys)
    return result
}


print(solution("KAKAO"))
print(solution("TOBEORNOTTOBEORTOBEORNOT"))
