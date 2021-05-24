// https://leetcode.com/problems/longest-word-with-all-prefixes/
class Solution1 {
    func longestWord(_ words: [String]) -> String {
        var map = [Int:Set<String>]()
        words.forEach { map[$0.count,default: []].insert($0)}
        let sortedMap = map.sorted { a, b in
            a.key > b.key
        }
//        print(sortedMap)
        func check(_ str: String) -> Bool {
            guard str.count > 1 else {
                return true
            }
            for length in 1..<str.count {
                guard let strs = map[length], strs.contains(String(str.prefix(length))) else {
                    return false
                }
            }
            return true
        }
        func getAns(_ strs: Set<String> ) -> String? {
            let sortedStrs = strs.sorted {$0 < $1}
            for str in sortedStrs {
                if check(str) {
                    return str
                }
            }
            return nil
        }
        for (_,strs) in sortedMap {
            if let s = getAns(strs) {
                return s
            }
        }
        return ""
    }
    
}

class Solution {
    func longestWord(_ words: [String]) -> String {
        var map = [Int:Set<String>]()
        words.forEach { map[$0.count,default: []].insert($0)}
        guard let singleChars = map[1] else {
            return ""
        }
        var memo = [String:Bool]()
        
        let sortedWords = words.sorted { s1,s2 in
            if s1.count == s2.count {
                return s1 < s2
            }
            return s1.count > s2.count
        }
        func dfs(_ word: String) -> Bool {
            if let t = memo[word] {
                return t
            }
            if word.count == 1 {
                memo[word] = true
                return singleChars.contains(word)
            }
            guard let nextWords = map[word.count - 1] else {
                memo[word] = false
                return false
            }
            for nw in nextWords {
                if word.hasPrefix(nw) {
                    let t = dfs(nw)
                    memo[word] = t
                    return t
                }
            }
            memo[word] = false
            return false
        }
        for word in sortedWords {
            if dfs(word) {
                return word
            }
        }
        return ""
    }
}


