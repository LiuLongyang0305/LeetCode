// https://leetcode.com/problems/check-if-it-is-a-good-array/
class Solution {
    func isGoodArray(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return nums.isEmpty ? false : nums[0] == 1
        }
        var ans = nums[0]
        for num in nums {
            ans = gcd(ans, num)
            guard ans != 1 else {
                return true
            }
        }
        return false
    }
    private func gcd(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else {
            return a
        }
        return gcd(b, a % b)
    }
}

