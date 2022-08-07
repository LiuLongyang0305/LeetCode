// https://leetcode.com/problems/minimum-replacements-to-sort-the-array/
class Solution {
    func minimumReplacement(_ nums: [Int]) -> Int {
        let reversedNumbers = nums.reversed()
        var ans = 0
        var last = reversedNumbers.first!
        for num in reversedNumbers{
            if num <= last {
                last = num
                continue
            }

            let v = (num + last - 1) / last

            ans +=  v - 1
            last = num / v
        }
        return ans
    }


}