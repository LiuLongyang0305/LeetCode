//https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/
class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        var stackLeft = Array<Character>()
        var rightCount = 0
        for char in S {
            if char == "(" {
                stackLeft.append(char)
            } else {
                if stackLeft.isEmpty {
                    rightCount += 1
                } else {
                    stackLeft.popLast()
                }
            }
        }
        return rightCount + stackLeft.count
    }
}