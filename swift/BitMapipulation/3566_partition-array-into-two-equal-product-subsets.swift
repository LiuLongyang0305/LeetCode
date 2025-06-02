//https://leetcode.cn/problems/partition-array-into-two-equal-product-subsets/
class Solution {

    func checkEqualPartitions(_ nums: [Int], _ target: Int) -> Bool {

        guard nums.max()! <= target else {return false}
        let N = nums.count
        
        for mask in 1..<(1 << N - 1) {

            var left = 1
            var right = 1

            for i in 0..<N {
                if mask & (1 << i) > 0 {
                    if nums[i] >= Int.max / left {
                        continue
                    }
                    left *= nums[i]
                } else {
                    if nums[i] >= Int.max / right {
                        continue
                    }
                    right *= nums[i]
                }
                if left > target || right > target {
                    continue
                }
            }
            if left == target && right == target {
                return true
            }
        }


        return false
    }
}
