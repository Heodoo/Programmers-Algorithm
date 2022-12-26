import Foundation

func solution(_ s:String) -> Int {
    var st : [String] = []
    var arr : [String] = s.map {
        String($0)
    }
    var k = 0
    var answer = 0
    if s.count%2 == 1 {
        return 0
    }
    
    while k < s.count {
        var flag = 1
        for i in k ..< k + s.count {
            let idx = i%s.count
            if arr[idx] == "[" || arr[idx] == "(" || arr[idx] == "{" {
                st.append(arr[idx])
            }else{
                if st.isEmpty {
                    flag = 0
                    break
                }
                var cur = st.removeLast()
                if cur == "[" && arr[idx] == "]" {
                    continue
                }
                else if cur == "(" && arr[idx] == ")" {
                    continue
                }
                else if cur == "{" && arr[idx] == "}" {
                    continue
                } else {
                    flag = 0
                    break
                }
            }
        }
        if flag == 1{
            answer += 1
        }
        
        k+=1
        
    }
    
    
    
    return answer
}
