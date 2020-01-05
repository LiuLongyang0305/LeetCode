// https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/
class Solution {
    class DSU {
        var parent: [Int]
        init(_ size: Int) {
            parent = Array<Int>(0...size)
        }
        func find(_ node: Int) -> Int {
            var current = node
            while parent[current] != current {
                current = parent[current]
            }
            var temp = node
            while parent[temp] != current {
                (temp,parent[temp]) = (parent[temp],current)
            }
            return current
        }
        func join(_ first: Int, _ second: Int)  {
            parent[find(first)] = find(second)
        }
    }
    func removeStones(_ stones: [[Int]]) -> Int {
        let dsu = DSU(20000)
//        for stone in stones {
//            dsu.join(stone[0], stone[1] + 10000)
//        }
        stones.forEach { dsu.join($0[0], $0[1] + 10000) }
        var seen = Set<Int>()
//        for stone in stones {
//            seen.insert(dsu.find(stone[0]))
//        }
        stones.forEach { seen.insert(dsu.find($0[0]))}
        return stones.count - seen.count
    }
 }

