// https://leetcode.com/problems/sum-of-all-subset-xor-totals/
class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return  nums.isEmpty ? 0 : nums[0]
        }
        var ans = 0
        let N = nums.count
        let maxMask = Int(pow(2, Double(N)))
        for i in 1..<maxMask{
            var temp = 0
            for bit in 0..<N {
                if i & (1 << bit) != 0 {
                    temp ^= nums[bit]
                }
            }
            ans += temp
        }
        return ans
    }
}

