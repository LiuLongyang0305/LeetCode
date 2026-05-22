    //https://leetcode.cn/problems/length-of-the-longest-valid-substring/
    class Solution {
        func longestValidSubstring(_ word: String, _ forbidden: [String]) -> Int {
            let forbiddenSet = Set<String>(forbidden)
            var sb = 0
            var left = 0
            let chars = [Character](word)
            let N = chars.count
            for right in 0..<N {
                var i = right
                while i >= left &&  i > right - 10 {
                    if forbiddenSet.contains(String(chars[i...right])) {
                        left = i + 1
                        break
                    }
                    i -= 1
                }
                sb = max(sb,right - left + 1)
            }
            return sb
        }
    }
