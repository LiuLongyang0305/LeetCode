//https://leetcode.com/problems/maximum-nesting-depth-of-two-valid-parentheses-strings/
class Solution {
    func maxDepthAfterSplit(_ seq: String) -> [Int] {
        var ans = Array<Int>(repeating: 0, count: seq.count)
        let chars = [Character](seq)
        for i in 0..<seq.count {
            ans[i] = chars[i]  == "(" ? i & 1 : (1 - i) & 1
        }
        return ans
    }
}


class Solution2 {
    func maxDepthAfterSplit(_ seq: String) -> [Int] {
        var i = 0
        return seq.map { (ch) -> Int in
            i += 1
            return ch == "(" ? 1 & i : (1 -  i) & 1
        }
    }
}