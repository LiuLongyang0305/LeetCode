// https://leetcode.cn/problems/longest-common-prefix-between-adjacent-strings-after-removals/
import Collections
struct MinPair: Comparable {
    static func < (lhs: MinPair, rhs: MinPair) -> Bool {
        return lhs.commomPreffixLength < rhs.commomPreffixLength
    }

    var idx: Int
    var commomPreffixLength: Int
}

class Solution {
    func longestCommonPrefix(_ words: [String]) -> [Int] {
        let N = words.count
        var  preffixLength = [Int](repeating: 0, count: N)
        var heap = Heap<MinPair>()
        for i in 0..<N {
            guard i + 1 < N else {
                break
            }
            let l = getCommonPreffixLength(words[i], words[i + 1])
            heap.insert(MinPair(idx: i, commomPreffixLength: l))
            preffixLength[i] = l
        }
        var sb = [Int](repeating: 0, count: N)
        var leftMaxLength = -1
        for i in 0..<N {
            if  i - 2 >= 0 {
                leftMaxLength = max(leftMaxLength, preffixLength[i - 2])
            }
            while let maxNode = heap.max, maxNode.idx <= i {
                let _ = heap.popMax()
            }
            sb[i] = max(leftMaxLength, heap.max?.commomPreffixLength ?? 0, i > 0 && i < N - 1 ? getCommonPreffixLength(words[i - 1], words[i + 1]) : 0)
        }
        return sb
    }
    private func  getCommonPreffixLength(_ s1: String, _ s2: String) -> Int {
        var i = s1.startIndex
        var j = s2.startIndex
        var l = 0
        while i < s1.endIndex && j < s2.endIndex && s1[i] == s2[j] {
            l += 1
            i = s1.index(after: i)
            j = s2.index(after:j)
        }
        return l
    }
}
