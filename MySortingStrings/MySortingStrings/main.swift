import Foundation

//func solution(_ strings:[String], _ n:Int) -> [String] {
//    return strings.sorted { s1, s2 in
//        let startIndex1 = s1.index(s1.startIndex, offsetBy: n)
//        let startIndex2 = s2.index(s2.startIndex, offsetBy: n)
//        let range1 = startIndex1...
//        let range2 = startIndex2...
//        return startIndex1 == startIndex2 ? s1 < s2 : s1[range1] < s2[range2]
//    }
//}

func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted {
        var s1 = Array($0)
        var s2 = Array($1)
        return s1[n] == s2[n] ? $0 < $1 : s1[n] < s2[n]
    }
}




print(solution(["sun","bed","car","aar"], 1))
