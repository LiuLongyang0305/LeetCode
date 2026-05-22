// https://leetcode.cn/problems/count-connected-subgraphs-with-even-node-sum/
    class Solution {
        func evenSumSubgraphs(_ nums: [Int], _ edges: [[Int]]) -> Int {
            let N = nums.count

            func check(_ nodeSet:Set<Int>) -> Bool {
                guard nodeSet.count > 1 else {return true}
                var graph = [Set<Int>](repeating: [], count: N)
                for e in edges {
                    let f = e[0], t = e[1]
                    guard nodeSet.contains(f) && nodeSet.contains(t) else {continue}
                    graph[f].insert(t)
                    graph[t].insert(f)
                }

                var visited = Set<Int>()
                func dfs(_ cur: Int) {
                    visited.insert(cur)
                    for next in graph[cur] {
                        if !visited.contains(next) {
                            dfs(next)
                        }
                    }
                }
                 dfs(nodeSet.first!)
                return nodeSet == visited
            }
            var sb = 0
            for mask in 1..<(1 << N) {
                var nodeSet = Set<Int>()
                var sum = 0
                for i in 0..<N {
                    if mask & (1 << i) != 0 {
                        nodeSet.insert(i)
                        sum += nums[i]
                    }
                }
                
                guard sum % 2 == 0 else {continue}
                if check(nodeSet) {
                    sb += 1
                }
            }
            return sb
        }
    }
