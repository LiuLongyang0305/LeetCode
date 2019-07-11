//https://leetcode.com/problems/vowel-spellchecker/

let vowels = Set<Character>("aeiouAEIOU")
class Solution {
    
    var wordsPerfect = Set<String>()
    var wordsCapitalization = [String: String]()
    var wordsVowels = [String:String]()
    
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        
        
        for word in wordlist {
            wordsPerfect.insert(word)
            let wordLowcase = word.lowercased()
            if nil  == wordsCapitalization[wordLowcase] {
                wordsCapitalization[wordLowcase] = word
            }
            let wordReplaceVowels = devowel(wordLowcase)
            if nil == wordsVowels[wordReplaceVowels] {
                wordsVowels[wordReplaceVowels] = word
            }
        }
        
        var ans = Array<String>()
        for query in queries {
            ans.append(solve(query))
        }
        return ans
    }
    
    private func solve(_ query: String) -> String {
        if wordsPerfect.contains(query) {
            return query
        }
        if let queryCap =  wordsCapitalization[query.lowercased()] {
            return queryCap
        }
        if let queryVowels = wordsVowels[devowel(query)]  {
            return queryVowels
        }
        return ""
    }
    
    private func devowel(_ word: String) -> String {
        var ans = ""
        for ch in word {
            ans.append(vowels.contains(ch) ? "*" : ch)
        }
        return ans.lowercased()
    }
}
