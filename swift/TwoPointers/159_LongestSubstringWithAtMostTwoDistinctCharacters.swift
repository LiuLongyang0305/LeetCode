// https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        guard s.count > 2 else {
            return s.count
        }
        var counter = [Character:Int]()
        let chars = [Character](s)
        let N = chars.count
        var left = 0
        var right = 0
        var ans = Int.min
        while right < N {
            counter.updateValue((counter[chars[right]] ?? 0) + 1, forKey: chars[right])
            while counter.count > 2  {
                if let c = counter[chars[left]] {
                    if c == 1 {
                        counter.removeValue(forKey: chars[left])
                    } else {
                        counter.updateValue((counter[chars[left]] ?? 0 ) - 1, forKey: chars[left])
                    }
                }
                left += 1
            }
            ans = max(ans, right - left + 1)
            right += 1
        }
        return ans
    }
}