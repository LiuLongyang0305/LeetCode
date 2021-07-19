// https://leetcode-cn.com/problems/string-transforms-into-another-string/
class Solution {
    func canConvert(_ str1: String, _ str2: String) -> Bool {
        var map = [Character:Character]()
        var set = Set<Character>()
        var idx1 = str1.startIndex
        var idx2 = str2.startIndex
        while idx1 < str1.endIndex && idx2 < str2.endIndex {
            if !set.contains(str2[idx2]) {
                set.insert(str2[idx2])
            }
            if let ch = map[str1[idx1]] {
                guard ch == str2[idx2] else {
                    return false
                }
            } else {
                map[str1[idx1]] = str2[idx2]
            }
            idx1 = str1.index(after: idx1)
            idx2 = str2.index(after: idx2)
        }
        if set.count == 26 {
            return str1 == str2
        }
        return true
    }
}