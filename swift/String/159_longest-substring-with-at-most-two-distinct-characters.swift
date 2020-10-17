// https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        guard s.count > 2 else {
            return s.count
        }
        let chars = [Character](s)
        let N = s.count
        var ans = 2
        var left = 0
        var right = 0
        var cnt = [Character:Int]()
        while right < N {
            while  right < N && (cnt.count < 2  || nil != cnt[chars[right]])  {
                cnt[chars[right], default: 0 ] += 1
                right += 1
            }
            ans = max(ans, right - left)
            while cnt.count == 2 {
                if let c = cnt[chars[left]] {
                    if c == 1 {
                        cnt.removeValue(forKey: chars[left])
                    } else {
                        cnt[chars[left]] = c - 1
                    }
                }
                left += 1
            }
        }
        return ans
    }
}