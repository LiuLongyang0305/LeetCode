// https://leetcode.com/problems/number-of-excellent-pairs/
class Solution {
    func countExcellentPairs(_ nums: [Int], _ k: Int) -> Int {
        var cnt = 0
        var counter = [Int](repeating: 0, count: 31)
        for num in Set<Int>(nums) {
            counter[num.nonzeroBitCount] += 1
        }
        var suffixSum = 0
        var j = 30
        for c in 0...30 {
            guard counter[c] > 0 else {continue}
            while j >= 0 && c + j >= k {
                suffixSum += counter[j]
                j -= 1
            }
            cnt += counter[c] * suffixSum
        }
        return cnt
    }
}