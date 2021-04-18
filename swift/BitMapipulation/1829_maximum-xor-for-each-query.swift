// https://leetcode.com/problems/maximum-xor-for-each-query/
class Solution {
    private let bits = (0...20).map {1 << $0}
    func getMaximumXor(_ nums: [Int], _ maximumBit: Int) -> [Int] {
        var total = nums.reduce(0) {$0 ^ $1}
        var ans = [Int]()
        for idx in stride(from: nums.count - 1, through: 0, by: -1) {
            var maxAns = 0
            for bit in 0..<maximumBit {
                if total & bits[bit] == 0 {
                    maxAns |= bits[bit]
                }
            }
            ans.append(maxAns)
            total = total ^ nums[idx]
        }
        return ans
    }
}

