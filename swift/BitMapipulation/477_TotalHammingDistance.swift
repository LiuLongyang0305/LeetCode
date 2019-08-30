//https://leetcode.com/problems/total-hamming-distance/
class Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        var ans = 0
        let length = nums.count
        var numberOnes = Array<Int>(repeating: 0, count: 32)
        for i in 0..<length {
            var temp = nums[i]
            for j in 0..<32 {
                numberOnes[j] += (temp & 1)
                temp >>= 1
            }
        }
        for i in 0..<32 {
            ans  +=  (numberOnes[i] *  (length  - numberOnes[i]))
        }
        return ans
    }
}