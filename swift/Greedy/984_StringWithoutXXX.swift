//https://leetcode.com/problems/string-without-aaa-or-bbb/
class Solution {
    func strWithout3a3b(_ A: Int, _ B: Int) -> String {
        var ans = ""
        if A == B {
            for _ in 0..<A {
                ans.append(contentsOf: "ab")
            }
            return ans
        }
        return construcrStr(A: A, B: B)
    }
    private func construcrStr(A: Int, B: Int) -> String {
        var ans = ""
        let doubleChars = A > B ? "aa" : "bb"
        let doubleCharCount = A > B ? A - B - 1 : B - A - 1
        let singleChar: Character = A > B ? "a" : "b"
        let otherChar: Character = A > B ? "b" : "a"
        let compomentsNumber = min(A, B)
        var i = 0
        while i < compomentsNumber {
            if i < doubleCharCount {
                ans.append(doubleChars)
            } else {
                ans.append(singleChar)
            }
            ans.append(otherChar)
            i += 1
        }
        if i >= doubleCharCount {
            ans.append(singleChar)
        } else {
            ans.append(doubleChars)
        }
        return ans
    }
}
