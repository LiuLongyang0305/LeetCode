// https://leetcode.com/problems/range-addition/
class Solution {
    func getModifiedArray(_ length: Int, _ updates: [[Int]]) -> [Int] {
        var ans = Array<Int>(repeating: 0, count: length)
        for update in updates {
            ans[update[0]] += update[2]
            if update[1] != length - 1 {
                ans[update[1] + 1] -= update[2]
            }
        }
        if length > 1 {
            for j in 1..<length {
                ans[j] += ans[j - 1]
            }
        }
        return ans
    }
}
