//https://leetcode.com/problems/implement-magic-dictionary/
class MagicDictionary {
    var magicDictionary = Dictionary<Int,[String]>()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Build a dictionary through a list of words */
    func buildDict(_ dict: [String]) {
        for word in dict {
            let  count  = word.count
            if nil == magicDictionary[count] {
                magicDictionary[count] = [word]
            } else {
                magicDictionary[count]?.append(word)
            }
        }
    }
    
    /** Returns if there is any word in the trie that equals to the given word after modifying exactly one character */
    func search(_ word: String) -> Bool {
        var count = word.count
        let wordChars = Array<Character>(word)
        
        func compare(second: String) -> Bool {
            let secondChars = Array<Character>(second)
            var diff = 0
            for i in 0..<count {
                if wordChars[i] != secondChars[i] {
                    diff += 1
                    if diff == 2 {
                        return false
                    }
                }
            }
            
            return diff == 1
        }
        if let words = magicDictionary[count] {
            for str in words {
                if compare(second: str) {
                    return true
                }
            }
        } 
        return false
    }
    

}

/**
 * Your MagicDictionary object will be instantiated and called as such:
 * let obj = MagicDictionary()
 * obj.buildDict(dict)
 * let ret_2: Bool = obj.search(word)
 */
