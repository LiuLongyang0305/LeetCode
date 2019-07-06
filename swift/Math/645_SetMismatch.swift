//https://leetcode.com/problems/set-mismatch/
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var ans = Array<Int>
        var count = Array<Int>(repeating: 0, count: nums.count)
        for ele in nums {
            count[ele - 1] += 1
        }
        ans.append(count.firstIndex(of: 2)! + 1)
        ans.append(count.firstIndex(of: 0)! + 1)
        return ans
    }
}