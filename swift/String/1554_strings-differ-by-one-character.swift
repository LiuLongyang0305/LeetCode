// https://leetcode.com/problems/strings-differ-by-one-character/
class Solution {
    func differByOne(_ dict: [String]) -> Bool {
        guard dict.count > 1 else {
            return false
        }
        var existed = Set<String>()
        let M = dict[0].count
        for word in dict {
            var wordChars = [Character](word)
            for index in 0..<M {
                let ch = wordChars[index]
                wordChars[index] = "*"
                let str = String(wordChars)
                if existed.contains(str) {
                    return true
                }
                existed.insert(str)
                wordChars[index] = ch
            }
        }
        return false
    }
}