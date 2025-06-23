// https://leetcode.com/problems/minimum-increments-to-equalize-leaf-paths/
class Solution {
    func minIncrease(_ n: Int, _ edges: [[Int]], _ cost: [Int]) -> Int {
        var tree = [Int:[Int]]()
        for e in edges {
            tree[e[0],default: []].append(e[1])
            tree[e[1],default: []].append(e[0])
        }


        var ans =  0

        func dfs(_ node: Int, _ parent: Int) -> Int {
            var subTreeSum = [Int]()

            for next in tree[node] ?? [] {
                if next != parent {
                    subTreeSum.append(dfs(next, node))
                }
            }

            guard subTreeSum.count > 1 else {return (subTreeSum.first ?? 0) + cost[node]}

            let maxSum = subTreeSum.max()!
            for sum in subTreeSum {
                if sum != maxSum {
                    ans += 1
                }
            }

            return maxSum + cost[node]
        }

        dfs(0,-1)

        return ans
    }
}
