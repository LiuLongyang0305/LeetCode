// https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/
class Solution {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        return String(s.suffix(s.count - n)) + String(s.prefix(n))
    }
}