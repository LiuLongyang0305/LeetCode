// https://leetcode.com/problems/remove-digit-from-number-to-maximize-result/
class Solution {
    func removeDigit(_ number: String, _ digit: Character) -> String {
        var ans = ""

        var idx = number.startIndex
        while idx < number.endIndex {
            if number[idx] == digit {
                let t = String(number[..<idx] + number[number.index(after: idx)...])
                if t > ans {
                    ans = t
                }
            }
            idx = number.index(after: idx)
        }


        return ans
    }
}