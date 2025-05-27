//https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments/
class Solution {
    let lowcaseCharToNextChar: [Character:Character] = ["q": "r", "t": "u", "x": "y", "z": "a", "w": "x", "l": "m", "h": "i", "v": "w", "c": "d", "p": "q", "a": "b", "e": "f", "b": "c", "y": "z", "k": "l", "g": "h", "n": "o", "d": "e", "r": "s", "s": "t", "j": "k", "m": "n", "u": "v", "f": "g", "o": "p", "i": "j"]
    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {

        let chars = [Character](str1)
        var i = 0
        let N = chars.count
        for ch in str2 {

            while i < N {
                if chars[i] == ch || lowcaseCharToNextChar[chars[i]]! == ch {
                    break
                }
                i += 1
            }
            if i == N {
                return false
            }
            i += 1
        }
        return true
    }
}
