// https://leetcode.com/problems/longest-common-subsequence-between-sorted-arrays/
class Solution {
    func longestCommomSubsequence(_ arrays: [[Int]]) -> [Int] {
        var ans = [Int]()
        var existed = Array<Int>(repeating: 0, count: 101)
        for arr in arrays {
            arr.forEach { existed[$0] += 1}
        }
        for i in 0...100 {
            if existed[i] == arrays.count {
                ans.append(i)
            }
        }
        return ans
    }
}