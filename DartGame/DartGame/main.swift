// 프로그래머스 lv1 다트게임

//1차시도 너무 별로임
//func solution(_ dartResult:String) -> Int {
//    var answer = 0
//
//    var rounds:[Int] = [0]
//    var round = 0
//    var i = 0
//    for x in dartResult{
//        if x.isNumber {
//            if i>0 && Array(dartResult)[i-1].isNumber {
//                var tmp = rounds.removeLast() * 10 + Int(String(x))!
//                rounds.append(tmp)
//            }else{
//                rounds.append(Int(String(x))!)
//                round += 1
//            }
//        }else if x=="D"{
//            rounds[round] *= rounds.last!
//
//        }else if x=="T"{
//            rounds[round] = rounds.last! * rounds.last! * rounds.last!
//        }else if x=="*"{
//            if round != 1{
//                rounds[round-1] *= 2
//            }
//            rounds[round] *= 2
//        }else if x=="#"{
//            rounds[round] *= -1
//        }
//        i+=1
//    }
//    answer = rounds.reduce(0) {
//        $0 + $1
//    }
//
//
//    return answer
//}
import Foundation

func seperateString(_ str: String)->[String] {
    var record = ""
    var result: [String] = []
    for c in str {
        if c.isNumber {
            record += String(c)
        }else{
            if !record.isEmpty{
                result.append(record)
                record = ""
            }
            result.append(String(c))
        }
        
    }
    return result
}

//Array 시간복잡도
//append(_) O(1) 최악의 경우 O(n) - 메모리 재할당할 경우
//removeFirst O(n),removeLast O(1)
func solution(_ dartResult:String) -> Int {
    let seperatedDartResult = seperateString(dartResult)
    var score: [Int] = []
    var tmp = 0
    for item in seperatedDartResult {
        tmp = 0
        if item.isNumber {
            score.append(Int(item) ?? 0)
        }else{
            switch item {
            case "D":
                tmp = score.removeLast()
                tmp *= tmp
                score.append(tmp)
            case "T":
                tmp = score.removeLast()
                tmp *= tmp * tmp
                score.append(tmp)
            case "*":
                tmp = score.removeLast()
                tmp *= 2
                if !score.isEmpty {
                    var tmp2 = score.removeLast()
                    tmp2 *= 2
                    score.append(tmp2)
                }
                score.append(tmp)
            case "#":
                tmp = score.removeLast()
                tmp *= -1
                score.append(tmp)
            default:
                continue
            }
        }
        
    }
    
    
    return score.reduce(0){ $0 + $1 }
}

print(solution("1S2D*3T"))


extension String {
    var isNumber : Bool {
        let compare = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: compare)
    }
    
}
