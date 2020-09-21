// https://leetcode.com/problems/maximum-sum-obtained-of-any-permutation/
class Solution {
    private let MOD = 1_000_000_007
    func maxSumRangeQuery(_ nums: [Int], _ requests: [[Int]]) -> Int {
        guard !requests.isEmpty else {
            return 0
        }
        var ans = 0
        let sortedNums = nums.sorted { $0 > $1}
        let N = nums.count
        var cnt = Array<Int>(repeating: 0, count: N + 1)
        for requst in requests {
            cnt[requst[0]] += 1
            cnt[requst[1] + 1] -= 1
        }
        for j in 1...N {
            cnt[j] += cnt[j - 1]
        }
        cnt.sort { $0 > $1}
        // print(cnt)
        for i in 0..<N {
            ans += ((sortedNums[i] * cnt[i]) % MOD)
            ans %= MOD
        }
        return ans
    }
}