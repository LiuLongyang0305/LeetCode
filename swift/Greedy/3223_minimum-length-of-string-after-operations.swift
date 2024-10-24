//https://leetcode.cn/problems/minimum-length-of-string-after-operations/
class Solution {
    func minimumLength(_ s: String) -> Int {
        var cnt = [Character:Int]()
        for ch in s {
            cnt[ch,default: 0] += 1
        }
        return cnt.reduce(0) { $0 + ($1.value % 2 == 0 ? 2 : 1)}
    }
}