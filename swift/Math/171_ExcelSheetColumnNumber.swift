//https://leetcode.com/problems/excel-sheet-column-number/
class Solution {
    func titleToNumber(_ s: String) -> Int {
        var ans = 0
        let aToInt = Int(Character("A").asciiValue!) - 1
        for ele in s {
            ans *= 26
            ans += Int(ele.asciiValue!) - aToInt
        }
        return ans
    }
}