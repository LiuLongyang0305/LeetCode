// https://leetcode.cn/problems/equal-score-substrings/
class Solution {
    func scoreBalance(_ s: String) -> Bool {
        var pre = [0]
        var cur = 0
        for ch in s {
            let t = Int(ch.asciiValue! - 96)
            cur += t
            pre.append(cur)
        }
        // print(pre)
        guard cur % 2 == 0 else {return false}
        return nil != pre.firstIndex(of: cur / 2)
    }
}
