//https://leetcode.com/problems/search-suggestions-system/ 
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
    private var  wordsCounter = [String:Int]()
    func insert(_ word: String) {
        var ws = root
        for char in word {
            if nil == ws.children[char] {
                ws.children[char] = TrieNode(char: char)
            }
            ws = ws.children[char]!
        }
        ws.isEndOfWord = true
        if let c = wordsCounter[word] {
            wordsCounter.updateValue(c + 1, forKey: word)
        } else {
            wordsCounter.updateValue(1, forKey: word)
        }
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
    func lastNodeOf(_ prefix: String) -> TrieNode? {
        var ws = root
        for char in prefix {
            if nil == ws.children[char] {
                return nil
            }
            ws = ws.children[char]!
        }
        return ws
    }
    func words(StartWith prefix: String) -> [String] {
        var ans = [String]()
        guard let lastNode = lastNodeOf(prefix) else {
            return []
        }
        
        func dfs(_ root: TrieNode?, currentStr: inout String) {
            guard let currentRoot = root else {
                return
            }
            guard ans.count  < 3 else {
                return
            }
            if let endOfWord = root?.isEndOfWord, endOfWord {
                if let c = wordsCounter[currentStr], c != 1 {
                    ans.append(contentsOf: Array<String>(repeating: currentStr, count: min(3  - ans.count, c)))
                } else {
                    ans.append(currentStr)
                }
            }
            let sortedKeys = currentRoot.children.keys.sorted()
            for ch in sortedKeys {
                currentStr.append(ch)
                dfs(root?.children[ch], currentStr: &currentStr)
                currentStr.removeLast()
            }
        }
        var  currentStr =  prefix
        dfs(lastNode, currentStr: &currentStr)
        return ans
    }
 }
 
 class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let trie = Trie()
        for product in products {
            trie.insert(product)
        }
        var ans = [[String]]()
        var prefix = ""
        for ch in searchWord {
            prefix.append(ch)
            ans.append(trie.words(StartWith: prefix))
        }
        return ans
    }
 }