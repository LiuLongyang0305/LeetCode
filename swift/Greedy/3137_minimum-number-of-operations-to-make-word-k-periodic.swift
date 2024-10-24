//https://leetcode.cn/problems/minimum-number-of-operations-to-make-word-k-periodic/
class Solution {
    func minimumOperationsToMakeKPeriodic(_ word: String, _ k: Int) -> Int {
        var idx = word.startIndex
        var map = [Int:Int]()
        var cur = ""
        while idx < word.endIndex {
            cur.append("\(word[idx])")
            if cur.count > k {
                cur.removeFirst()
            }
            if cur.count == k {
                map[cur.hashValue,default: 0] += 1
            }
            idx = word.index(after:idx)
        }
        return word.count / k - (map.values.max() ?? 0)
    }
}