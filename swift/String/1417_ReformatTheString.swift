// https://leetcode.com/problems/reformat-the-string
class Solution {
    func reformat(_ s: String) -> String {
        var ans = ""
        var letters = [Character]()
        var numbers = [Character]()
        for ch in s {
            if ch.isLetter {
                letters.append(ch)
            } else {
                numbers.append(ch)
            }
        }
        guard abs(letters.count - numbers.count) <= 1 else {
            return ""
        }
        if numbers.count >= letters.count {
            while !letters.isEmpty {
                ans.append(numbers.removeFirst())
                ans.append(letters.removeFirst())
            }
            if !numbers.isEmpty {
                ans.append(numbers.removeFirst())
            }
        } else {
            while !numbers.isEmpty {
                ans.append(letters.removeFirst())
                ans.append(numbers.removeFirst())
            }
            if !letters.isEmpty {
                ans.append(letters.removeFirst())
            }
        }
        return ans
    }
}

