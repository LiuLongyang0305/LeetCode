// https://leetcode.com/problems/k-divisible-elements-subarrays/
class Solution {
    func countDistinct(_ nums: [Int], _ k: Int, _ p: Int) -> Int {
        var set = Set<Int>()
        let N = nums.count
        for left in 0..<N  {
            var cnt = 0
            for right in left..<N {
                if nums[right] % p == 0 {
                    cnt += 1
                }
                if cnt <= k {
                    set.insert(nums[left...right].hashValue)
                } else {
                    break
                }
            }
        }
        return set.count
    }
}