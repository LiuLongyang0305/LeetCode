// https://leetcode.com/problems/bitwise-xor-of-all-pairings/
class Solution {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let M = nums1.count
        let N = nums2.count

        if M & 1 == 0 {
            return  N & 1 == 0 ? 0 : nums1.reduce(0) {$0 ^ $1}
        }
        if N & 1 == 0 {
            return nums2.reduce(0) {$0 ^ $1}
        }
        return nums2.reduce(0) {$0 ^ $1} ^ nums1.reduce(0) {$0 ^ $1}
    }
}