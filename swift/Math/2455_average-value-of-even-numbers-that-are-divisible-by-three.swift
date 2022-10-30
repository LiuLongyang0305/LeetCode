// https://leetcode.com/problems/average-value-of-even-numbers-that-are-divisible-by-three/
class Solution {
    func averageValue(_ nums: [Int]) -> Int {
        var sum = 0
        var n = 0
        for num in nums {
            if num & 1 == 0 && num % 3 == 0 {
                sum += num
                n += 1
            }
        }
        guard n > 0 else {return 0}
        return sum / n
    }
}