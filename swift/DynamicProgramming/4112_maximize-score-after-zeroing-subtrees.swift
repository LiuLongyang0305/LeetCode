 // https://leetcode.cn/problems/maximize-score-after-zeroing-subtrees/
    class Solution {
        func maxScore(_ parent: [Int], _ op: [Int], _ score: [Int]) -> Int {
            let N = parent.count
            var tree = [[Int]](repeating: [], count: N)
            for i in 1..<N {
                tree[parent[i]].append(i)
            }

            func dfs(_ x: Int) -> Int {
                var curSum = score[x]
                if tree[x].isEmpty {return curSum}
                var minSubTreeSum = Int.max
                for y in tree[x] {
                    let t = dfs(y)
                    curSum += t
                    minSubTreeSum = min(minSubTreeSum,t)
                }
                if minSubTreeSum < 0 || op[x] > 0 {
                    curSum -= minSubTreeSum
                }
                return curSum
            }



            return dfs(0)
        }
    }

