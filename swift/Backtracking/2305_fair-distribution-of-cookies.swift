//  https://leetcode.com/problems/fair-distribution-of-cookies/
class Solution {
    private var cookies = [Int]()
    private var k = 0
    private var ans = Int.max
    private var sum = [Int](repeating: 0, count: 8)
    private var M = 0
    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        self.cookies = cookies
        self.k = k
        self.M = cookies.count
        dfs(0)
        return ans
    }
    private func dfs(_ idx: Int) {
        guard idx < M else {
            ans  = min(ans,sum.max()!)
            return
        }
        for child in 0..<k {
            sum[child] += cookies[idx]
            if sum[child] < ans {
                dfs(idx + 1)
            }
            sum[child] -= cookies[idx]
        }
    }
}