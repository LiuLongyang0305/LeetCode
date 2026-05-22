// https://leetcode.cn/problems/mirror-frequency-distance/
    class Solution {
        let letterToOrder = Dictionary(uniqueKeysWithValues: (0..<26).map { (Character(UnicodeScalar(97 + $0)!), $0) })
        let numberCharsToOrder = Dictionary(uniqueKeysWithValues: (0...9).map { (Character(UnicodeScalar(48 + $0)!), $0) })
        func mirrorFrequency(_ s: String) -> Int {
            var lowercaseCounter = [Int](repeating: 0, count: 26)
            var numberCharsCounter = [Int](repeating: 0, count: 10)
            for ch in s {
                if ch.isNumber {
                    numberCharsCounter[numberCharsToOrder[ch]!] += 1
                } else {
                    lowercaseCounter[letterToOrder[ch]!] += 1
                }
            }

            var sb = 0

            var i = 0
            var j = 25
            while i < j {
                sb += abs(lowercaseCounter[i] - lowercaseCounter[j])
                i += 1
                j -= 1
            }

            i = 0
            j = 9
            while i < j {
                sb += abs(numberCharsCounter[i] - numberCharsCounter[j])
                i += 1
                j -= 1
            }
            return sb
        }
    }
