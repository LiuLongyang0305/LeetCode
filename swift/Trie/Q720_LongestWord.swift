//https://leetcode.com/problems/longest-word-in-dictionary/
class Q720_Solution {
    
    var wordsCopy = Array<Array<String>>(repeating: Array<String>(), count: 30)
    
    func getResult(resultLength: Int) -> String {
        wordsCopy[resultLength - 1].sort()
        return wordsCopy[resultLength - 1].first!
    }
    func longestWord(_ words: [String]) -> String {
        
        
        guard !words.isEmpty else {
            return ""
        }
        
        for word in words {
            wordsCopy[word.count - 1].append(word)
        }
        
        guard !wordsCopy[0].isEmpty else {
            return ""
        }
        
        for length in 1...29 {
            guard !wordsCopy[length].isEmpty else {
                return getResult(resultLength: length)
            }
            wordsCopy[length] = wordsCopy[length].filter({ str -> Bool in
                for prefix in wordsCopy[length - 1]{
                    if str.hasPrefix(prefix){
                        return true
                    }
                }
                return false
            })
            
            guard !wordsCopy[length].isEmpty else {
                return getResult(resultLength: length)
            }
        }
        return wordsCopy[29].isEmpty ? "" : getResult(resultLength: 30)
    }
}
