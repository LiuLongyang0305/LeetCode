// https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/
class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let total = nums.reduce(0) { $0 + $1}
        guard  total >= x else {
            return -1
        }
        guard total > x else {
            return nums.count
        }
        let N = nums.count
        var ans = Int.max
        var preffix = [Int:Int]()
        var sum = 0
        for idx in 0..<N {
            sum += nums[idx]
            preffix[sum] = idx
        }
        sum = 0
        var suffix = [Int:Int]()
        for idx in stride(from: N - 1, through: 0, by: -1) {
            sum += nums[idx]
            suffix[sum] = idx
        }
        if let idx = suffix[x] {
            ans = min(ans, N - idx)
        }
        if let idx = preffix[x] {
            ans = min(ans, idx + 1)
        }
        for (s,idx) in preffix {
            guard s < x else {
                continue
            }
            let t = x - s
            if let rIdx = suffix[t],idx < rIdx {
                ans = min(ans, idx + 1 + N - rIdx)
            }
        }
        return ans == Int.max ? -1 : ans
    }
}