import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    var k = discount.count < 11 ? 0 : discount.count - 10
    for i in 0...k {
        var flag = true
        var check = Dictionary<String,Int>()
        for i in 0..<want.count {
            check[want[i]] = number[i]
        }
        for j in i..<i+10 {
            if check[discount[j]] != nil {
                check[discount[j]]! -= 1
            }else{
                flag = false
                break
            }
        }
        for value in check.values {
            if value != 0 {
                flag = false
                break
            }
        }
        if flag {
            result += 1
        }
    }
    
    
    
    return result
}

//result 3
print(solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))


//첫시도 실패
/*
 import Foundation

 func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
     var result = 0
     
     var total : Int {
         var t = 0
         for num in number {
             t += num
         }
         return t
     }
     
     //초기화 여러번을 막기위한 flag
     var flag = false
     //var start = discount[0]
     var start = 0
     //var startK = 0
     //var end = discount[total-1]
     var end = total - 1
     var check = Dictionary<String,Int>()
     for i in 0..<want.count {
         check[want[i]] = number[i]
     }
     
     for dc in discount {
         if check[dc] != nil{
             if check[dc]! > 0 {
                 check[dc]! -= 1
             }else{
                 var k = start
                 while k < end {
                     if discount[k] != dc {
                         if check[discount[k]] != nil{
                             check[discount[k]]! += 1
                         }
                     }else{
                         start = k + 1
                         break
                     }
                     k+=1
                 }
                 
                 if k == end {
                     for i in 0..<want.count {
                         check[want[i]] = number[i]
                     }
                     check[dc]! -= 1
                 }
                 
             }
             
             
             
             flag = false
         }else {
             if flag {continue}
             for i in 0..<want.count {
                 check[want[i]] = number[i]
             }
             flag = true
         }
         
         
         if end > total - 1 {
             //start = end - total
             var isAllZero = true
             for value in check.values {
                 if value != 0 {
                     isAllZero = false
                 }
             }
             if isAllZero {
                 result += 1
                 if check[discount[start]] != nil {
                     check[discount[start]]! += 1
                 }
                 //check[discount[end]]! += 1
                 start += 1
             }
         }
         
         end+=1
     }
     
     
     
     return result
 }
 
 */
