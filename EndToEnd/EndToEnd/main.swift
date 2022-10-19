import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    // 1. 끝말잇기가 안될 경우 -> 오류
    // 2. 같은 말을 할 경우(중복) -> 오류
    // 3. 탈락자가 없을 경우 -> [0,0]
    
    var db: [String] = [words[0]]

        for i in 1..<words.count {
            //중복된 경우
            for a in db {
                if a == words[i] {
                    return [i%n+1,i/n+1]
                }
            }
            // 끝말잇기가 안될 경우
            var s1 = words[i-1].last
            var s2 = words[i].first
            if s1 != s2 {
                return [i%n+1,i/n+1]
            }
            
            db.append(words[i])
            
        }
    
    return [0,0]
}


print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))

/*
 
 잘한점:
 
 못한점:
 
 */
