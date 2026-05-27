    //https://leetcode.cn/problems/password-strength/
    class Solution {
        func passwordStrength(_ password: String) -> Int {
            var existedChars = Set<Character>()
            var sb = 0
            for ch in password{
                guard !existedChars.contains(ch) else {continue}
                existedChars.insert(ch)
                sb += getScore(ch)
            }
            return sb
        }
        private func getScore(_ ch: Character) -> Int {
            if ch.isLowercase {
                return 1
            }
            if ch.isUppercase {
               return 2
            }
            if ch.isNumber {
                return 3
            }
            return 5
        }
    }
