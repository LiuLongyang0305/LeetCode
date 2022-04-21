// https://leetcode.com/problems/stream-of-characters/
class TrieNode {
    var children : Dictionary<Character,TrieNode> = Dictionary<Character,TrieNode>()
    var isEndOfWord = false
    var char : Character
    init(char : Character) {
        self.char = char
    }
}

class Trie {


    public var root : TrieNode = TrieNode(char: " ")

    public func insert(_ word: String) {
        var ws = root
        for char in word {
            if nil == ws.children[char] {
                ws.children[char] = TrieNode(char: char)
            }
            ws = ws.children[char]!
        }
        ws.isEndOfWord = true
    }
    
    public func startsWith(_ prefix: String) -> Bool {
        var ws = root
        for char in prefix {
            guard let next = ws.children[char] else {return false}
            guard !next.isEndOfWord else {return true}
            ws = next
        }
        return false
    }
}

class StreamChecker {

    private let trie = Trie()
    private var receivedChars = ""
    init(_ words: [String]) {
        words.forEach { word in
            let reversedWord = String(word.reversed())
            trie.insert(reversedWord)
        }
    }

    func query(_ letter: Character) -> Bool {
        receivedChars.insert(letter, at: receivedChars.startIndex)
        return trie.startsWith(receivedChars)
    }
}

/**
 * Your StreamChecker object will be instantiated and called as such:
 * let obj = StreamChecker(words)
 * let ret_1: Bool = obj.query(letter)
 */