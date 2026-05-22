    //https://leetcode.cn/problems/first-matching-character-from-both-ends/
    class Solution {
        func firstMatchingIndex(_ s: String) -> Int {
            let chars = [Character](s)
            var i = 0
            var j = chars.count - 1
            while i <= j {
                if chars[i] == chars[j] {
                    return i
                }
                i += 1
                j -= 1
            }
            return -1
        }
    }
