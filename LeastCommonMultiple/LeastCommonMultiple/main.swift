// 공통의 최소공배수
import Foundation

func solution(_ arr:[Int]) -> Int {
    //아이디어1
    //가장 작은 순으로 정렬 후 배열이 1이 될때까지 나누기
    //아이디어2 <- 채택
    //작은거부터 두개씩 공배수 찾기
    var result: Int = 1
    var prev : Int = arr.first!
    for cur in arr[1...] {
        result = lcm(cur, prev)
        prev = result
    }
    return result
}
//유클리드 호제법, 최대공약수 구하기
func gdc(_ a: Int,_ b: Int)->Int{
    if b == 0 {
        return a
    }
    return gdc(b,a%b)
}
//최소공배수 구하기
func lcm (_ a: Int, _ b: Int)->Int{
    return a*b/gdc(a, b)
}

print(solution([2,6,8,14]))
//2,6 6
//6,8 24
//24 14 168
