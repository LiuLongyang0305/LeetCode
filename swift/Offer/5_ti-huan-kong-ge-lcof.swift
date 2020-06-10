// https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/
class Solution {
    func replaceSpace(_ s: String) -> String {
        return  s.replacingOccurrences(of: " ", with: "%20")
    }
}