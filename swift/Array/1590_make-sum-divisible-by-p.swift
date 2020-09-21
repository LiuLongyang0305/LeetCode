// https://leetcode.com/problems/make-sum-divisible-by-p/
class Solution {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        guard p != 1 else {
            return 0
        }
        let mod = nums.reduce(0) { ($0 + $1) % p}
        guard mod != 0 else {
            return 0
        }
        var r_mod = 0
        var min_w = nums.count
        var pos = [Int:Int]()
        pos[0] = -1
        for idx in 0..<nums.count {
            r_mod = (r_mod + nums[idx]) % p
            let cmp = (p - mod + r_mod) % p
            if let idx2 = pos[cmp] {
                min_w = min(min_w, idx - idx2)
            }
            pos[r_mod] = idx
        }
        return min_w >= nums.count ? -1 : min_w
    }
}