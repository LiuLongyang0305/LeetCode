// https://leetcode.com/problems/maximum-cost-of-trip-with-k-highways/
class Solution1 {
    private typealias Pair = (city:Int, cost: Int)
    func maximumCost(_ n: Int, _ highways: [[Int]], _ k: Int) -> Int {
        guard k < n else {return -1}
        var graph = [[Pair]](repeating: [], count: n)
        for highway in highways {
            graph[highway[0]].append((highway[1],highway[2]))
            graph[highway[1]].append((highway[0],highway[2]))
        }
        var ans = -1


        func dfs(_ node: Int, _ curCost: Int, _ curCnt: Int, _ visited: inout Int) {
            guard curCnt < k else {
                ans = max(ans,curCost)
                return
            }

            visited |= (1 << node)

            for (next,cost) in graph[node] {
                guard visited & (1 << next) == 0 else {
                    continue
                }
                dfs(next, cost + curCost, curCnt + 1, &visited)
            }
            visited &= ~(1 << node)
        }


        for start in 0..<n {
            var visited = 0
            dfs(start, 0, 0, &visited)
        }
        return ans
    }
}


class Solution {
    private typealias Pair = (city:Int, cost: Int)
    func maximumCost(_ n: Int, _ highways: [[Int]], _ k: Int) -> Int {
        guard k < n else {return -1}
        var graph = [[Pair]](repeating: [], count: n)
        for highway in highways {
            graph[highway[0]].append((highway[1],highway[2]))
            graph[highway[1]].append((highway[0],highway[2]))
        }

        var memo = [Int:Int]()

        func dfs(_ curNode: Int, _ visited: Int) -> Int {
            guard visited.nonzeroBitCount != k + 1 else {
                return 0
            }
            let key = curNode << 20 | visited
            guard nil == memo[key] else {return memo[key] ?? -1}
            var ans = Int.min
            for (next,cost) in graph[curNode] {
                guard visited & (1 << next) == 0 else {continue}
                ans = max(ans, dfs(next, visited | (1 << next)) + cost)
            }
            memo[key] = ans
            return ans
        }

        var ans = -1
        for start in 0..<n {
            ans = max(ans,dfs(start, 1 << start))
        }
        return ans
    }
}