// https://leetcode.com/problems/find-the-most-competitive-subsequence/
class Solution {
    func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {

        guard k != 1 else {
            return [nums.min()!]
        }
        let N = nums.count
        guard N != k && N > 1 else {
            return nums
        }
        var ans = [Int]()
        for idx in 0..<N {
            while !ans.isEmpty && N - idx > k - ans.count && ans.last! > nums[idx] {
                ans.removeLast()
            }
            if ans.count < k { 
                ans.append(nums[idx])
            }
        }
        return ans
    }
}

