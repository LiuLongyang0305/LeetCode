    // https://leetcode.cn/problems/finish-time-of-tasks-i/
    class Solution {
        func finishTime(_ n: Int, _ edges: [[Int]], _ baseTime: [Int]) -> Int {
            var tree = [[Int]](repeating: [], count: n)
            for e in edges {
                tree[e[0]].append(e[1])
            }

            func dfs(_ task: Int) -> Int {
                if tree[task].isEmpty {return  baseTime[task]}
                var earlist = Int.max
                var latest = Int.min
                for ch in tree[task] {
                    let t = dfs(ch)
                    earlist = min(earlist,t)
                    latest = max(latest,t)
                }
                return latest + (latest - earlist) + baseTime[task]
            }
            return dfs(0)
        }
    }
