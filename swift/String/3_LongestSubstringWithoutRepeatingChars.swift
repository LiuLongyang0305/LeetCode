//https://leetcode.com/problems/longest-substring-without-repeating-characters/
class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        var ans = 0
        var left = s.startIndex
        var right = s.startIndex
        var setChars = Set<Character>()
        let end = s.endIndex
        while left < end && right < end {
            if !setChars.contains(s[right])  {
                setChars.insert(s[right])
                right = s.index(after: right)
                ans = max(ans, setChars.count)
            } else {
                setChars.remove(s[left])
                left = s.index(after: left)
            }
        }
        return ans
    }
}
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