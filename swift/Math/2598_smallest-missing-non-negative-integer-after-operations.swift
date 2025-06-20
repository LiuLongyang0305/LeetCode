//https://leetcode.com/problems/smallest-missing-non-negative-integer-after-operations/
class Solution {
    func findSmallestInteger(_ nums: [Int], _ value: Int) -> Int {
        var counter = [Int:Int]()
        for num in nums {
            counter[(num % value + value) % value, default: 0] += 1
        }
        var i = 0
        while let c = counter[i % value], c >= 1 {
            counter[i % value, default: 0] -= 1
            i += 1
        }
        return i
    }
}
