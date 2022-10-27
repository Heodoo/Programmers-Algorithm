//프로그래머스 lv2 행렬의 곱셈

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    let rowCount = arr2[0].count
    let colCount = arr1.count
    let colCount2 = arr2.count
    let rowCount1 = arr1[0].count
    
    let count = max(max(rowCount,rowCount1), max(colCount, colCount2))
    var result : [[Int]] = Array(repeating: Array(repeating: 0, count: rowCount), count: colCount)
    for y in 0..<colCount{
        for x in 0..<rowCount {
            //처음풀때는 두 행렬의 로우나 컬럼의 가장 큰 곳을 범위로 잡고 풀었음
            for k in 0..<arr1[y].count {
               // if k >= rowCount1 || k >= colCount2 { break }
                result[y][x] += arr1[y][k] * arr2[k][x]
            }
        }
    }
    return result
}



print(solution([[1, 4, 3], [3, 2, 1]], [[3, 3], [3, 3],[5,5]]))
//[[15, 15], [15, 15], [15, 15]]
/*
 1 4 3   3 3
 3 2 1 * 3 3
         5 5
 3x2 m 2x2 = 3x2
 Arow1* Bcol1
 */
