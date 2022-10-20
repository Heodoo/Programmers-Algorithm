//삼총사 문제

import Foundation

// dfs로 길이가 3인 부분집합 배열을 찾아서 더하면 되지 않을까?


func solution(_ number:[Int]) -> Int {
    var result = 0
    
    return result
}



//전체집합의 길이는 5, 부분집합의 길이는 3으로 가정하고 부분집합을 반환하는 dfs 풀이
var number = [-2, 3, 0, 2, -5]
var result: [[Int]] = []
var visit : [Bool] = [false,false,false,false,false]
func dfs(cur: Int, visited : [Bool], count : Int) {
    var visited = visited
    if count == 3 {
        var subset: [Int] = []
        for b in visited.enumerated() {
            if b.element {
                subset.append(number[b.offset])
            }
        }
        result.append(subset)
        return
    }
    
    for i in cur...4 {
        if(!visited[i]){
            visited[i] = true
            dfs(cur: i,visited: visited, count: count + 1)
            visited[i] = false
        }
    }
    
}


dfs(cur:0,visited: visit, count: 0)
print(result)



//print(solution([-2, 3, 0, 2, -5]))

