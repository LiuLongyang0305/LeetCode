    // https://leetcode.cn/problems/count-the-number-of-k-free-subsets
class Solution {
    func countTheNumOfKFreeSubsets(_ nums: [Int], _ k: Int) -> Int {
        var groups = [Int: [Int]]()
        for num in nums {
            groups[num % k, default: []].append(num)
        }
        var res = 1
        for (_, arr) in groups {
            res *= solve(arr, k)
        }
        return res
    }

    private func solve(_ values: [Int], _ k: Int) -> Int {
        let sorted = values.sorted()
        let N = sorted.count
        if N == 0 { return 1 }
        var memo = [Int?](repeating: nil, count: N)

        func dfs(_ i: Int) -> Int {
            guard i >= 0 else { return 1 }
            if let cnt = memo[i] {
                return cnt
            }

            // 不选 sorted[i]
            var ans = dfs(i - 1)

            // 选 sorted[i]
            if i == 0 {
                ans += 1                    // 只选自己
            } else if sorted[i] - sorted[i - 1] == k {
                ans += dfs(i - 2)           // 不能选 i-1，跳到 i-2
            } else {
                ans += dfs(i - 1)           // 差 > k，随便选
            }

            memo[i] = ans
            return ans
        }

        return dfs(N - 1)
    }
}
