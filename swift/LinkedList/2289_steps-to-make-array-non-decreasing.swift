// https://leetcode.com/problems/steps-to-make-array-non-decreasing/
class Solution {
    private let INF = 1_000_000_000
    func totalSteps(_ _nums: [Int]) -> Int {
        guard _nums.count > 1 else {
            return 0
        }
        let nums = _nums + [INF]
        let N = nums.count
        var next = [Int](repeating: 0, count: N)
        for i in 0..<N {
            next[i] = i + 1
        }
        var existed = [Bool](repeating: true, count: N)
        var v = [Int]()
        var i = N - 2
        while i >= 0 {
            if nums[i] > nums[i + 1] {
                v.append(i)
            }
            i -= 1
        }
        var ans = 0
        while true {
            var v2 = [Int]()
            for i in v {
                if existed[i] && nums[i] > nums[next[i]] {
                    existed[next[i]] = false
                    next[i] = next[next[i]]
                    v2.append(i)
                }
            }
            guard !v2.isEmpty else {
                return ans
            }
            ans += 1
            v = v2
        }
        return -1
    }
}