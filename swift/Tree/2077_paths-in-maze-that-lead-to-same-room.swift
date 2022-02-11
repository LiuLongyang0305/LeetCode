// https://leetcode.com/problems/paths-in-maze-that-lead-to-same-room/
class Solution {
    func numberOfPaths(_ n: Int, _ corridors: [[Int]]) -> Int {
        var tree = [Set<Int>](repeating: [], count: n + 1)
        for e in corridors {
            tree[e[0]].insert(e[1])
            tree[e[1]].insert(e[0])
        }
        
        var cyclesSet = Set<Int>()
        for second in 1...n {
            for first in tree[second] {
                for third in tree[second] {
                    guard first != third else {continue}
                    if tree[third].contains(first) {
                        let minNode = min(first, second,third)
                        let maxNode = max(first, second,third)
                        let middleNode = first + second + third - minNode - maxNode
                        let key = (maxNode << 30) | (middleNode << 15) | minNode
                        if !cyclesSet.contains(key) {
                            cyclesSet.insert(key)
                        }
                    }
                }
            }
        }
        return cyclesSet.count
    }
}