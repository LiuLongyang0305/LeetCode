//https://leetcode.com/problems/find-and-replace-pattern/
class Solution {
    var patternLength = 0
    var patternToArray = [Character]()
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        patternToArray = Array<Character>(pattern)
        patternLength = pattern.count
        
        var ans = [String]()
        for word in words {
            if match(word: word) {
            ans.append(word)
            }
        }
        return ans
    }
    func match(word: String) -> Bool {
        
        var mapPatternToWord = Dictionary<Character,Character>()
        var mapWordToPattern = Dictionary<Character,Character>()
        
        let wordToArr = Array<Character>(word)
        
        for i in 0..<patternLength {
            let key = patternToArray[i]
            let val = wordToArr[i]
            
            if mapWordToPattern[val] == nil {
                mapWordToPattern[val] = key
            }
            if mapPatternToWord[key] == nil {
                mapPatternToWord[key] = val
            }
            if mapWordToPattern[val] != key || mapPatternToWord[key] != val {
                return false
            }
        }
        return true
    }
}

var words = ["abc","deq","mee","aqq","dkd","ccc"]
var pattern = "abb"
Solution().findAndReplacePattern(words, pattern)
