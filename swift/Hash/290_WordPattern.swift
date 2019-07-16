//https://leetcode.com/problems/word-pattern/
class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let chars = Array<Character>(pattern)
        let words  = str.components(separatedBy: " ")
        guard chars.count == words.count else {
            return false
        }
        var charMapString = Dictionary<Character,String>()
        var stringMapChar = Dictionary<String,Character>()
        for i in 0..<chars.count {
            let ch = chars[i]
            let word = words[i]
            if charMapString[ch] == nil {
                charMapString[ch] = word
            }
            if stringMapChar[word] == nil {
                stringMapChar[word] = ch
            }
            
            if stringMapChar[word] != ch || charMapString[ch] != word {
                return false
            }
        }
        return true
    }
}
