// https://leetcode.com/contest/weekly-contest-160/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
class Solution {
    func maxLength(_ arr: [String]) -> Int {
        var map = [String: Set<Character>]()
        var ans = 0
        for str in arr {
            let chars = Set<Character>(str)
            if chars.count == str.count {
                for (key, existedChars) in map {
                    if existedChars.intersection(chars).isEmpty {
                        let newStr = ""  + key  + str
                        map[newStr] = existedChars.union(chars)
                        ans = max(ans, newStr.count)
                    }
                }
                map[str] = chars
                ans = max(ans, str.count)
                if ans == 26 {
                    return 26
                }
            }
        }
        return ans
    }
}