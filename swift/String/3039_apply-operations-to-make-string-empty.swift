// https://leetcode.cn/problems/apply-operations-to-make-string-empty/
class Solution {
    func lastNonEmptyString(_ s: String) -> String {
        var charToCnt = [Character:Int]()
        var charToIndex = [Character:Int]()
        var i = 0
        for ch in s {
            charToCnt[ch,default: 0] += 1
            charToIndex[ch] = i
            i += 1
        }
        let maxCnt = charToCnt.values.max()!
        for (ch,c) in charToCnt {
            if c < maxCnt {
                charToIndex.removeValue(forKey: ch)
            }
        }

        let sortedCharToIndex = charToIndex.sorted { f, s in
            f.value < s.value
        }
        var ans = ""
        for (ch,_) in sortedCharToIndex {
            ans.append(ch)
        }
        return ans
    }
}
