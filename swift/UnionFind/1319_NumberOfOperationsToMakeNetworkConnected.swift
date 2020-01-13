 //https://leetcode.com/problems/number-of-operations-to-make-network-connected/
 class Solution {
    class DSU {
        private var parent: [Int]
        private var compomentsCount: Int
        init(_ size: Int) {
            parent = Array<Int>(0...size)
            compomentsCount = size
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
            let firstRoot = find(find(first))
            let secondRoot = find(second)
            guard firstRoot != secondRoot else {
                return
            }
            compomentsCount -= 1
            parent[firstRoot ] = secondRoot
        }
        func getCompomentsCount() -> Int {
            return compomentsCount
        }
    }
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        guard connections.count >= n - 1 else {
            return -1
        }
        let dsu = DSU(n)
        for connection in connections {
            dsu.join(connection[0], connection[1])
        }
//        connections.forEach {
//            dsu.join($0[0], $0[1])
//        }
//        var roots = Set<Int>()
//        for i in 0..<n {
//            roots.insert(dsu.find(i))
//        }
//
        return dsu.getCompomentsCount() - 1
    }
 }