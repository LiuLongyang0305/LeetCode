// https://leetcode.com/problems/decompress-run-length-encoded-list/ 
class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        for i in 0..<(nums.count >> 1) {
            ans.append(contentsOf: Array<Int>(repeating: nums[ i << 1 + 1], count: nums[ i << 1]))
        }
        return ans
    }
 }