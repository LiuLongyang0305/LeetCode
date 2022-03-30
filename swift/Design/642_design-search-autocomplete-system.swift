// https://leetcode.com/problems/design-search-autocomplete-system/
class TrieNode {
    var children : Dictionary<Character,TrieNode> = Dictionary<Character,TrieNode>()
    var isEndOfWord = false
    var char : Character
    var  cnt = 0
    init(char : Character) {
        self.char = char
    }
}

class Trie {
    
    public var root : TrieNode = TrieNode(char: " ")
    public func insert(_ word: String, _ cnt: Int) {
        var ws = root
        for char in word {
            if nil == ws.children[char] {
                ws.children[char] = TrieNode(char: char)
            }
            ws = ws.children[char]!
        }
        ws.isEndOfWord = true
        ws.cnt += cnt
    }

    public func startWith(_ prefix: String) -> TrieNode? {
        var ws = root
        for char in prefix {
            guard let next = ws.children[char] else {return nil}
            ws = next
        }
        return ws
    }


    public func countwords(with preffix: String, _ k: Int) -> [String] {

        guard let root = startWith(preffix) else {return []}

        var ans = [(word: String,cnt: Int)]()

        func  dfs(_ curNode: TrieNode?, _ curPreffix: String) {

            guard let node = curNode else {
                return
            }

            if node.isEndOfWord {
                ans.append((curPreffix,node.cnt))
            }

            for (ch, next) in node.children {
                dfs(next, curPreffix + "\(ch)")
            }
        }

        dfs(root, preffix)

        ans.sort { p1, p2 in
            if p1.cnt == p2.cnt {
                return p1.word < p2.word
            }
            return p1.cnt > p2.cnt
        }
        return ans.prefix(k).map {$0.word}
    }
}
class AutocompleteSystem {

    let trieTree = Trie()
    private static var preffix = ""
    init(_ sentences: [String], _ times: [Int]) {
        let N = sentences.count
        for i in 0..<N {
            trieTree.insert(sentences[i], times[i])
        }
    }

    func input(_ c: Character) -> [String] {
        guard c != "#" else {
            trieTree.insert(AutocompleteSystem.preffix, 1)
            AutocompleteSystem.preffix = ""
            return []
        }
        AutocompleteSystem.preffix.append(c)
        return trieTree.countwords(with: AutocompleteSystem.preffix, 3)
    }
}
/**
 * Your AutocompleteSystem object will be instantiated and called as such:
 * let obj = AutocompleteSystem(sentences, times)
 * let ret_1: [String] = obj.input(c)
 */