import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var answer : Int = 0
    var cur  = n
    
    while cur >= a  {
        answer += cur/a*b
        if cur%a != 0 {
            cur = cur/a*b + cur%a
        }else{
            cur = cur/a*b
        }
    }
    return answer
}





//result = 19
print(solution(2, 1, 20))
//(0,20) (10,0) (0,10) (5,0) (0,5) (2,1) (0,3) (1,1) (0,2) (1,0)
