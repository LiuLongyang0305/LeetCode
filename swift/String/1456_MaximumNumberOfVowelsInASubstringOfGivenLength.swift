// https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/
class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var ans = 0
        var cnt = 0
        let chars = [Character](s)
        let vowels = Set<Character>("aeiou")
        for i in 0..<chars.count {
            if vowels.contains(chars[i]) {
                cnt += 1
            }
            if i >= k {
                if vowels.contains(chars[i - k]) {
                    cnt -= 1
                }
            }
            ans = max(ans, cnt)
        }
        return ans
    }
}