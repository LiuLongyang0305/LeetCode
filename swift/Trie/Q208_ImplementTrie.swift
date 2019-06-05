class Trie {
    class TrieNode {
        var children : Dictionary<Character,TrieNode> = Dictionary<Character,TrieNode>()
        var isEndOfWord = false
        var val : Character? = nil
        init(char : Character) {
            self.val = char
        }
    }
    
    private var root : TrieNode = TrieNode(char: " ")
    
    func insert(_ word: String) {
        var ws = root
        for char in word {
            if nil == ws.children[char] {
                ws.children[char] = TrieNode(char: char)
            }
            ws = ws.children[char]!
        }
        ws.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        var ws = root
        for char in word {
            if nil == ws.children[char] {
                return false
            }
            ws = ws.children[char]!
        }
        return ws.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var ws = root
        for char in prefix {
            if nil == ws.children[char] {
                return false
            }
            ws = ws.children[char]!
        }
        return true
    }
}