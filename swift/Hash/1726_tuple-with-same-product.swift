// https://leetcode-cn.com/problems/tuple-with-same-product/
class Solution {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N >= 4 else {
            return 0
        }
        var counter = [Int:Int]()
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                counter[nums[i] * nums[j], default: 0] += 1
            }
        }
        var ans = 0
        for (_,cnt) in counter {
            if cnt > 1 {
                ans += (cnt - 1) * cnt / 2
            }
        }
        return ans * 8
    }
}