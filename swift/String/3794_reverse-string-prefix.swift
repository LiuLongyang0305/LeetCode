//https://leetcode.cn/problems/reverse-string-prefix/
class Solution {
    func reversePrefix(_ s: String, _ k: Int) -> String {
        return  k == s.count ? String(s.reversed()) :  (String(s.prefix(k).reversed()) + String(s.suffix(s.count - k)))
    }
}
