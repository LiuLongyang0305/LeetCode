// https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        var ans = 0
        var left = 0
        let length = s.count
        let chars = Array<Character>(s)
        var charToIndex: [Character:Int]  = [:]
        for right in 0..<length{
            if let index = charToIndex[chars[right]] {
                left =  max(index, left)
            }
            ans = max(ans, right - left + 1)
            charToIndex[chars[right]] = right + 1
        }
        return ans
    }
}