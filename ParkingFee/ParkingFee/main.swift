//프로그래머스 lv2 주차요금계산


import Foundation


struct Car {
    var hh: Int
    var mm: Int
    var name:String
    
    init(hhmm: String ,name: String) {
        let a = hhmm.components(separatedBy: ":")
        self.hh = Int(a[0])!
        self.mm = Int(a[1])!
        self.name = name
    }
}


func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var result : [Int] = []
    var feeCar : [String:Int] = [:]
    var cars : [Car] = []
    //In 이면 cars 에 추가
    // Out 이면 뒤에서 부터 탐색 ㄱ ㄱ 찾아서 바로 계산후에 result.append
    for record in records {
        var seperate = record.components(separatedBy: " ")
        var car = Car(hhmm: seperate[0] ,name: seperate[1])
        if seperate[2] == "IN"{
            cars.append(car)
        }else {
            //1. 시간 계산
            var i = 0
            for c in cars.reversed() {
                if c.name == car.name {
                    if feeCar.keys.contains(car.name) {
                        feeCar[car.name]! += (car.hh-c.hh)*60 + (car.mm - c.mm)
                    }else{
                        feeCar[car.name] = (car.hh-c.hh)*60 + (car.mm - c.mm)
                    }
                    break
                }
                i+=1
            }
            cars.remove(at: cars.count-i-1)
        }
    }
    
    if !cars.isEmpty {
        for c in cars {
            if feeCar.keys.contains( c.name) {
                feeCar[c.name]! += (23-c.hh)*60 + (59 - c.mm)
            }else{
                feeCar[c.name] = (23-c.hh)*60 + (59 - c.mm)
            }
        }
    }
    
    //fees 0: 기본시간(분) 1: 기본 요금(원) 2: 단위 시간(분) 3: 단위요금 (원)
    //요금계산
    //34 + 300 = 334
    //
    //-> 5000 +⌈(334 - 180) / 10⌉x 600 = 34400 (이상한 기호는 올림)
    //print(feeCar)
    //정렬 name 작은순
    var sortedfeeCar = feeCar.sorted {
        Int($0.key)! < Int($1.key)!
    }
    print(sortedfeeCar)
    for (name,time) in sortedfeeCar {
        if time <= fees[0]{
            result.append(fees[1])
        }else{
            var calc = fees[1] + Int(ceil(Double(time-fees[0]) / Double(fees[2]))) * fees[3]
            result.append(calc)
        }
    }

    
    
    
    return result
}




print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
