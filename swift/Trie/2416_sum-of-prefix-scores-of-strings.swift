// https://leetcode.com/problems/sum-of-prefix-scores-of-strings/
class TrieNode {
    var children : Dictionary<Character,TrieNode> = Dictionary<Character,TrieNode>()
    var isEndOfWord = false
    var char : Character
    var cnt = 0
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
            ws.cnt += 1
            ws = ws.children[char]!
        }
        ws.cnt += 1
        ws.isEndOfWord = true
    }
    public func startsWith(_ prefix: String) -> Int {
        var ws = root
        var ans = 0
        for char in prefix {
            guard let next = ws.children[char] else {return -1}
            ws = next
            ans += ws.cnt
        }
        return ans
    }
}
class Solution {
    func sumPrefixScores(_ words: [String]) -> [Int] {

        let trie = Trie()
        for word in words {
            trie.insert(word)
        }
        // print(trie.root.cnt)
        var ans = [Int]()
        for word in words {
            ans.append(trie.startsWith(word))
        }
        return ans
    }
}