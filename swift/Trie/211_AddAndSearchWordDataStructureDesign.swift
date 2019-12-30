// https://leetcode.com/problems/add-and-search-word-data-structure-design/
 class WordDictionary {
    private class TrieNode {
        
        var data: Character
        var children = Dictionary<Character,TrieNode>()
        var  isEndingOfWord  = false
        init(_ data: Character ) {
            self.data = data
        }
    }
    
    private let root = TrieNode("/")
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var p = root
        for ch in word {
            if let child = p.children[ch]  {
                p = child
            } else {
                let  node = TrieNode(ch)
                p.children[ch] = node
                p = node
            }
        }
        p.isEndingOfWord = true
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return  word.contains(".") ?  searchRegularExpression(word, node: root): searchCommonWord(word)
    }
    
    private func display(_ node: TrieNode)    {
        print("currentNode = \(node.data) isEndOfWord = \(node.isEndingOfWord) children = \(node.children.keys)")
        for (_, child) in node.children {
            display(child)
        }
    }
    private func searchCommonWord(_ word: String) -> Bool{
        var ws = root
        for char in word {
            if nil == ws.children[char] {
                return false
            }
            ws = ws.children[char]!
        }
        return ws.isEndingOfWord
    }
    private func searchRegularExpression(_ expression: String,  node: TrieNode?) -> Bool {
        var word = expression
        let ch = word.removeFirst()
        if ch != "."  {
            guard let next = node?.children[ch] else {
                return false
            }
            if word.isEmpty {
                return next.isEndingOfWord
            }
            return searchRegularExpression(word, node: next)
        }
        
        guard let nextNodes = node?.children else {
            return false
        }
        if word.isEmpty {
            for (_,next) in nextNodes {
                if next.isEndingOfWord {
                    return true
                }
            }
            return  false
        }
        for (_,next) in nextNodes {
            if searchRegularExpression(word, node: next) {
                return true
            }
        }
        return false
    }
 }
 /**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
