 // https://leetcode-cn.com/problems/implement-trie-ii-prefix-tree/
class Trie {
    private class TrieNode {
        var val: Character? = nil
        var children: [Character:TrieNode] = [:]
        var wordCnt: Int = 0
        var isEndOfWord = false
        var preffixCnt = 0
        init() {
        }
        init(_ val: Character) {
            self.val = val
        }
    }
    private let root: TrieNode? = TrieNode()
    
    init() {
        
    }
    
    func insert(_ word: String) {
        var node = root
        for ch in word {
            if nil == node?.children[ch] {
                node?.children[ch] = TrieNode(ch)
            }
            if let c = node?.children[ch]?.preffixCnt {
                node?.children[ch]?.preffixCnt = c + 1
            }
            node = node?.children[ch]
        }
        node?.isEndOfWord = true
        if let c = node?.wordCnt {
            node?.wordCnt = c + 1
        }
    }
    
    func countWordsEqualTo(_ word: String) -> Int {
        var node = root
        
        for ch in word {
            guard let next = node?.children[ch] else {
                return 0
            }
            node = next
        }
        guard let flag = node?.isEndOfWord, flag else {
            return 0
        }
        return node?.wordCnt ?? 0
    }
    
    func countWordsStartingWith(_ prefix: String) -> Int {
        var node = root
        for ch in prefix {
            guard let next = node?.children[ch] else {
                return 0
            }
            node = next
        }
        return node?.preffixCnt ?? 0
    }
    
    func erase(_ word: String) {
        var node = root
        for ch in word {
            guard let next = node?.children[ch] else {
                return
            }
            next.preffixCnt -= 1
            node = next
        }
        if let c = node?.wordCnt {
            if c == 1 {
                node?.isEndOfWord = false
            }
            node?.wordCnt -= 1
        }
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Int = obj.countWordsEqualTo(word)
 * let ret_3: Int = obj.countWordsStartingWith(prefix)
 * obj.erase(word)
 */