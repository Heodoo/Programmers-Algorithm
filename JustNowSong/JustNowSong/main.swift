//프로그래머스 lv2 방금그곡

import Foundation

//각 음은 1분
//재생시간이 길면 반복재생
//


func solution(_ m:String, _ musicinfos:[String]) -> String {
    var correctList = [(Int,String)]()
    var comp = m
    comp = comp
        .replacingOccurrences(of: "A#", with: "a")
        .replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
    for musicinfo in musicinfos {
        var data = musicinfo.components(separatedBy: ",")
        var lhs = data[0].components(separatedBy: ":").map{
            Int($0) ?? 0
        }
        var rhs = data[1].components(separatedBy: ":").map{
            Int($0) ?? 0
        }
        //12 40
        //15 20
        // 3 -20
        var time = ((rhs[0]-lhs[0]) * 60) + (rhs[1] - lhs[1])
        var name = String(data[2])
        var flot = ""
        var data3 = Array(data[3]
            .replacingOccurrences(of: "A#", with: "a")
            .replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
                          )
        var len = data3.count
        for i in 0..<time {
            flot += String(data3[i%len])
        }
        
        print(flot)
        if flot.contains(comp) {
            correctList.append((time, name))
        }
    }
    
    if correctList.isEmpty {
        return "(None)"
    }else {
        //여러개인경우 라디오에서 가장 긴 재생시간인 음악 리턴
        //재생시간도 같을 경우 먼저 입력된 음악 리턴
        correctList.sort {
            $0.0 <= $1.0
        }
        print(correctList)
        return correctList.last!.1
    }

}


print(solution("ABCDEFG", ["12:00,13:50,HELLO1,CDEFGAB","12:00,13:50,HELLO2,CDEFGAB","12:00,13:50,HELLO,CDEFGAB", "13:00,13:20,WORLD,ABCDEFG","12:00,13:50,HELLO3,CDEFGAB","13:40,15:30,WORLD2,ABCDEFG"]))

