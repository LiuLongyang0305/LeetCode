// https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/
class Solution {
    private typealias CharsCounter = [Character:Int]
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        // guard k < 26 else {
        //     return s.count
        // }
        guard k > 0 else {
            return 0
        }
        let N = s.count
        guard N > 1 else {
            return N
        }
        var ans = Int.min
        let chars = [Character](s)
        var counter = CharsCounter()
        var l = 0
        var r = 0
        while l <= r && r < N {
            while r < N && (counter.count < k || (counter.count == k && nil != counter[chars[r]])) {
                counter[chars[r],default: 0] += 1
                r += 1
            }
            ans = max(ans, r - l)
            while l < r && counter.count != k - 1 {
                if let c = counter[chars[l]] {
                    if c == 1 {
                        counter.removeValue(forKey: chars[l])
                    } else {
                        counter[chars[l]] = c - 1
                    }
                }
                l += 1
            }
        }
        return ans
    }
}
