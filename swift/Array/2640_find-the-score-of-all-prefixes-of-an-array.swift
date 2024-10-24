//https://leetcode.cn/problems/find-the-score-of-all-prefixes-of-an-array/
class Solution {
    func findPrefixScore(_ nums: [Int]) -> [Int] {
        var convert = [Int]()
        var ans = [Int]()
        var curSum = 0
        var maxNum = 0
        for num in nums {
            maxNum = max(maxNum,num)
            convert.append(num + maxNum)
            curSum += convert.last ?? 0
            ans.append(curSum)
        }
        return ans
    }
}
