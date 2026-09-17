// https://leetcode.cn/problems/longest-common-prefix-of-k-strings-after-removal/
class Solution {

    struct GroupAndMaxPreffixLen: Comparable {
        static func < (lhs: Solution.GroupAndMaxPreffixLen, rhs: Solution.GroupAndMaxPreffixLen) -> Bool {
            lhs.maxLen < rhs.maxLen
        }

        var startIdx: Int
        var maxLen: Int
    }

    typealias Pair = (idx: Int, word: String)

    func longestCommonPrefix(_ words: [String], _ k: Int) -> [Int] {
        let M = words.count
        guard k < M else {
            return [Int](repeating: 0, count: M)
        }

        let sortedWords: [Pair] = (0..<M).map { ($0, words[$0]) }.sorted { $0.word < $1.word }
        let wordsToChars = sortedWords.map { [Character]($0.word) }

        func getMaxPreffixLength(_ str1: [Character], _ str2: [Character]) -> Int {
            let len = min(str1.count, str2.count)
            var i = 0
            while i < len && str1[i] == str2[i] {
                i += 1
            }
            return i
        }

        func getGroupNumToMaxPrefixLength(_ cap: Int) -> [Int] {
            var result = [Int](repeating: 0, count: M)
            for left in 0...(M - cap) {
                let right = left + cap - 1
                result[left] = getMaxPreffixLength(wordsToChars[left], wordsToChars[right])
            }
            return result
        }

        let startIdxToMaxPrefixLenCapEqualToK = getGroupNumToMaxPrefixLength(k)
        guard startIdxToMaxPrefixLenCapEqualToK.max()! > 0 else {
            return [Int](repeating: 0, count: M)
        }

        let startIdxToMaxPreffixLenCapEqualToKPlusOne = getGroupNumToMaxPrefixLength(k + 1)

        var leftHeap = Heap<GroupAndMaxPreffixLen>()
        var rightHeap = Heap<GroupAndMaxPreffixLen>()
        var middleHeap = Heap<GroupAndMaxPreffixLen>()

        for i in 0...(M - k) {
            rightHeap.insert(GroupAndMaxPreffixLen(startIdx: i, maxLen: startIdxToMaxPrefixLenCapEqualToK[i]))
        }

        var result = [Int](repeating: 0, count: M)

        for idx in 0..<M {
            let removeIdx = sortedWords[idx].idx

            while let top = rightHeap.max, top.startIdx <= idx {
                _ = rightHeap.popMax()
            }

            if idx - k >= 0 {
                leftHeap.insert(GroupAndMaxPreffixLen(startIdx: idx - k, maxLen: startIdxToMaxPrefixLenCapEqualToK[idx - k]))
            }

            while let top = middleHeap.max, top.startIdx < idx + 1 - k {
                _ = middleHeap.popMax()
            }

            if idx > 0 {
                middleHeap.insert(GroupAndMaxPreffixLen(startIdx: idx - 1, maxLen: startIdxToMaxPreffixLenCapEqualToKPlusOne[idx - 1]))
            }

            result[removeIdx] = max(leftHeap.max?.maxLen ?? 0, rightHeap.max?.maxLen ?? 0, middleHeap.max?.maxLen ?? 0)
        }

        return result
    }
}
