//https://leetcode.com/problems/path-with-maximum-probability/
//TLE
class Solution_DFS {
    private let errorLimit = 1e-5
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var graph = [Int:[Int]]()
        var probality = [[Int]:Double]()
        for i in 0..<edges.count {
            let e = edges[i]
            graph[e[0],default: [] ].append(e[1])
            graph[e[1],default: [] ].append(e[0])
            probality[e] = succProb[i]
            probality[[e[1],e[0]]] = succProb[i]
        }
        var ans: Double = 0
        var memo = Array<Double>(repeating: 0.0, count: n)
        var visited = Array<Bool>(repeating: false, count: n)
        func dfs(_ node: Int, _ curProb: Double) {
            guard let children = graph[node] else {return}
            for next in children {
                guard !visited[next] else {
                    continue
                }
                let nextProb = curProb * probality[[node,next]]!
                guard nextProb > errorLimit && abs(nextProb - ans) > errorLimit else {
                    continue
                }
                guard nextProb > memo[next] else {
                    continue
                }
                memo[next] = nextProb
                guard next != end else {
                    ans = max(ans, nextProb)
                    if ans <= errorLimit {
                        return
                    }
                    continue
                }
                visited[next] = true
                dfs(next, nextProb)
                visited[next] = false
            }
        }
        visited[start] = true
        dfs(start, 1.0)
        return ans
    }
}


class Solution_BFS {
    private typealias State = (node:Int,prob:Double)
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var graph = [Int:[Int]]()
        var probality = [[Int]:Double]()
        for i in 0..<edges.count {
            let e = edges[i]
            graph[e[0],default: [] ].append(e[1])
            graph[e[1],default: [] ].append(e[0])
            probality[e] = succProb[i]
            probality[[e[1],e[0]]] = succProb[i]
        }
        var memo = Array<Double>(repeating: 0.0, count: n)
        memo[start] = 1.0
        var queue: [State] = [(start,1.0)]
        
        while !queue.isEmpty {
            var nextLevel = [State]()
            
            for s in queue {
                guard let children = graph[s.node] else {continue}
                for ch in children {
                    let nextProb = s.prob * probality[[s.node,ch]]!
                    guard memo[ch] < nextProb else {
                        continue
                    }
                    memo[ch] = nextProb
                    nextLevel.append((ch,nextProb))
                }

            }
            
            queue = nextLevel
        }
        return memo[end]
    }
}
