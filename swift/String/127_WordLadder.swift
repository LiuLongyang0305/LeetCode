//https://leetcode.com/problems/word-ladder/
class Solution {
    typealias BFSState = (word:String, level: Int)
    private var length = -1
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.contains(endWord) else {
            return 0
        }
        length = beginWord.count
        var tree = [String:[String]]()
        var strToKeys = [String:[String]]()
        strToKeys[beginWord] = createKeys(beginWord)
        for word in wordList {
            let keys = createKeys(word)
            strToKeys[word] = keys
            for root in keys {
                if nil == tree[root] {
                    tree[root] = []
                }
                tree[root]?.append(word)
            }
        }
        var queue = Array<BFSState>()
        queue.append((beginWord,1))
        var visited = Set<String>()
        visited.insert(beginWord)
        while !queue.isEmpty {
            let tempLength = queue.count
            for _ in 0..<tempLength {
                let state = queue.removeFirst()
                if let keys = strToKeys[state.word] {
                    for key in keys {
                        if let words = tree[key]  {
                            for word in words {
                                if word == endWord {
                                    return state.level + 1
                                }
                                if !visited.contains(word)  {
                                    visited.insert(word)
                                    queue.append((word,state.level + 1))
                                }
                            }
                        }
                    }
                }
            }
        }
        return 0
    }
     private  func createKeys(_ word: String) -> [String] {
        var ans = [String]()
        var chars = [Character](word)
        for i in 0..<length {
            let ch = chars[i]
            chars[i] = "*"
            ans.append(String(chars))
            chars[i] = ch
        }
        return ans
    }
}