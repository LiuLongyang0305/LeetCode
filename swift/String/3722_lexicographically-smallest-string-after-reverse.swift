//https://leetcode.cn/problems/lexicographically-smallest-string-after-reverse/
class Solution {
    func lexSmallest(_ s: String) -> String {
        var sb = s

        //翻转前半部分
        var left = ""
        var right = s
        while !right.isEmpty {
            left.insert(right.removeFirst(), at: left.startIndex)
            sb = min(sb,left + right)
        }
        //翻转后半部分
        right = String(s.reversed())
        left = ""
        while !right.isEmpty {
            left.append(right.removeLast())
            sb = min(sb,left + right)
        }
        return sb
    }
}
