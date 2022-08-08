// https://leetcode.com/problems/longest-ideal-subsequence/
class Solution {
    func longestIdealString(_ s: String, _ k: Int) -> Int {
        let  nums = s.map { Int($0.asciiValue ?? 0) - 97}
        //lastNum   Length
        var counter = [Int](repeating: 0, count: 26)
        for num in nums  {
            var maxLength = 1
            for last in 0..<26 {
                if abs(last - num) <= k {
                    maxLength = max(maxLength, counter[last] + 1)
                }
            }
            counter[num] = maxLength
        }
        return counter.max() ?? -1
    }
}