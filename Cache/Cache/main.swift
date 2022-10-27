//
//  main.swift
//  Cache
//
//  Created by 허두영 on 2022/10/24.
//

import Foundation

//캐시 힛 1 캐시 교체 5
//캐시사이즈 입력(<30), 입력도시 배열 순대로
// 캐시처리  LRU
class Node{
    var data : String
    var next : Node?
    var prev : Node?

    init(data : String, next : Node?, prev: Node?) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}

func printList(head:Node?){
    if let node = head{
        print(node.data)
        printList(head: node.next)
    }
}

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var total = 0
    var head = Node(data: "", next: nil, prev: nil)
    for city in cities {
        let lowerCity = city.lowercased()
        var cur = head.next
        var hit : Bool = false
        var cacheCount = 0
        while cur != nil && cacheCount < cacheSize {
            if cur?.data == lowerCity {
                //hit
                hit = true
                //print("hit: " + city)
                //여기서 hit item 삭제후 밑에서 cur 다시 추가할 예정
                cur?.prev?.next = cur?.next
                cur?.next?.prev = cur?.prev
                cacheCount -= 1
                break
            }
            cur = cur?.next
            cacheCount += 1
        }
        if cacheCount == cacheSize {
            cur?.prev?.next = cur?.next
            cur?.next?.prev = cur?.prev
        }

        var newNode = Node(data:lowerCity , next: head.next, prev: head)
        newNode.next?.prev = newNode
        head.next = newNode


        total += hit ? 1 : 5

       // printList(head: head)
    }
    return total
}


//print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
//print(solution(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]))


