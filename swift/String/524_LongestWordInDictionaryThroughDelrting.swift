//https://leetcode.com/problems/longest-word-in-dictionary-through-deleting/
class Solution {
    private var sChars = [Character]()
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        var map = [Int: [String]]()
        for str in d {
            if nil == map[str.count] {
                map[str.count] = []
            }
            map[str.count]?.append(str)
        }
        for (key,val) in map {
            map.updateValue(val.sorted(), forKey: key)
        }
        sChars = [Character](s)
        var  length = s.count
        while length > 0 {
            if let strs  = map[length] {
                for str in strs {
                    if length == s.count {
                        if s == str {
                            return str
                        }
                    }  else {
                        if match(str) {
                            return str
                        }
                    }
                }
            }
            length -= 1
        }
        return ""
    }
    private func match(_ target: String) -> Bool {
        let chars = [Character](target)
        var i = 0
        var j = 0
        while i < sChars.count && j < chars.count {
            while i < sChars.count && sChars[i] != chars[j] {
                    i += 1
            }
            guard i < sChars.count else {
                return false
            }
            i += 1
            j += 1
        }
        return j == chars.count
    }
 }