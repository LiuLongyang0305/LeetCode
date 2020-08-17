// https://leetcode.com/problems/make-the-string-great/
class Solution {
    func makeGood(_ s: String) -> String {
        var ans = ""
        for ch in s {
            if !ans.isEmpty && (abs(Int(ans.last!.asciiValue!) - Int(ch.asciiValue!)) == 32) {
                ans.removeLast()
            } else {
                ans.append(ch)
            }
        }
        return ans
    }
}

