// https://leetcode.com/problems/find-greatest-common-divisor-of-array/
class Solution {
    func findGCD(_ nums: [Int]) -> Int {
        return gcd(nums.min()!, nums.max()!)
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        return b > 0 ? gcd(b, a % b) : a
    }
}