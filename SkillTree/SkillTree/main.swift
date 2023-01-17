//
//  main.swift
//  SkillTree
//
//  Created by MacBook on 2022/12/13.
//

import Foundation

//1<=skil<=20
//1<= skilltrees count <=20
//2<= skilltrees[x].count <= 26
//중복 x
func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    let tree = Array(skill)
//        .map { c in
//        String(c)
//    }
    
    for skill_tree in skill_trees {
        var flag = true
        let arr = Array(skill_tree)
//            .map { c in
//            String(c)
//        }
        var i = 0
        for c in arr {
            if tree.contains(c) {
                if i >= tree.count {
                    flag = false
                    break
                }
                if c != tree[i] {
                    flag = false
                    break
                }else {
                    i+=1
                }
            }
        }
        if flag == true {
            answer += 1
        }
    }
    return answer
}



// result 2
print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
