// https://leetcode.com/problems/second-minimum-time-to-reach-destination/
class Solution {
    private typealias State = (node:Int, time:Int)
    func secondMinimum(_ n: Int, _ edges: [[Int]], _ time: Int, _ change: Int) -> Int {
        var adj = [[Int]](repeating: [], count: n + 1)
        edges.forEach { e in
            adj[e[0]].append(e[1])
            adj[e[1]].append(e[0])
        }
        var visitedTime = [Int](repeating: Int.max, count: n + 1)
        var vistedCount = [Int](repeating: 0, count: n + 1)
        var arrivedTime = Int.max
        var q = [State]()
        q.append((1,0));
        visitedTime[1] = 0
        visitedTime[1] = 1
        
        while !q.isEmpty {
            var nextLevel = [State]()
            for (node,t) in q {
                for next in adj[node] {
                    var t2 = t
                    let isRed = (t2 / change) % 2 != 0
                    if isRed {
                        t2 += change - t2 % change
                    }
                    t2 += time
                    if next == n && arrivedTime == Int.max {
                        arrivedTime = t2
                    }
                    if next == n && t2 > arrivedTime {
                        return t2
                    }
                    if visitedTime[next] != t2 && vistedCount[next] <= 1 {
                        visitedTime[next] = t2;
                        vistedCount[next] += 1
                        nextLevel.append((next,t2))
                    }
                }
            }
            q = nextLevel
        }
        return -1
    }
}