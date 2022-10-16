// https://leetcode.com/problems/create-components-with-same-value/
class Solution {
    func componentValue(_ nums: [Int], _ edges: [[Int]]) -> Int {
        let total = nums.reduce(0) {$0 + $1}
        let N = nums.count
        var tree = [[Int]](repeating: [], count: N)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }


        func  dfs(_ cur: Int, _ fa: Int, _ target: Int) -> Int {
            var sum = nums[cur]
            for child in tree[cur] {
                guard child != fa else {continue}
                let res = dfs(child, cur, target)
                if res < 0 {
                    return -1
                }
                sum += res
            }
            if sum > target {
                return -1
            }
            return sum < target ? sum : 0
        }
        let mx = nums.max()!

        for i in stride(from: min(N, total / mx), through: 1, by: -1) {
            guard total % i == 0 else {
                continue
            }
            let target = total / i
            if dfs(0, -1, target) == 0 {
                return i - 1
            }
        }
        return -1
    }
}