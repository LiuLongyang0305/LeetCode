 // https://leetcode.cn/problems/longest-common-suffix-queries/
class TrieNode1 {
    var children = [Character:TrieNode1]()
    var minLen = Int.max
    var bestIdx = -1
    var isEndOfWord = false
}
class Solution {
    func stringIndices(_ wordsContainer: [String], _ wordsQuery: [String]) -> [Int] {
        let root = TrieNode1()
        for i in 0..<wordsContainer.count {
            let chars = [Character](wordsContainer[i])
            if chars.count < root.minLen {
                root.minLen = chars.count
                root.bestIdx = i
            }

            var cur = root
            for j in stride(from: chars.count - 1, through: 0, by: -1) {
                if nil == cur.children[chars[j]] {
                    cur.children[chars[j]] = TrieNode1()
                }
                cur = cur.children[chars[j]]!
                if chars.count < cur.minLen {
                    cur.minLen = chars.count
                    cur.bestIdx = i
                }
            }
            cur.isEndOfWord = true
        }
        return wordsQuery.map { str in
            let chars = [Character](str)
            var cur = root
            for j in stride(from: chars.count - 1, through: 0, by: -1) {
                guard  let next = cur.children[chars[j]] else {break}
                cur = next
            }
            return cur.bestIdx
        }
    }
}
