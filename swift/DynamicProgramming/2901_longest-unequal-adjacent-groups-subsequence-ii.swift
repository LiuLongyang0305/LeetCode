//https://leetcode.com/problems/longest-unequal-adjacent-groups-subsequence-ii
class Solution {
    func getWordsInLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        let hanmingDis = calHanmingDis(of: words)
        let wordsLength = words.map { $0.count}
        let N = words.count
        var pre = [Int](repeating: -1, count: N)
        var dp = [Int](repeating: 1, count: N)

        for i in 0..<words.count {
            var t = 1
            var preI = i

            var j = 0
            while j < i {
                if wordsLength[i] == wordsLength[j] && hanmingDis[i][j] == 1 && groups[i] != groups[j] {
                    let l = dp[j] + 1
                    if l > t {
                        t = l
                        preI = j
                    }
                }
                j += 1
            }

            dp[i] = t
            pre[i] = preI

        }

        var sb = [String]()
        var idx = dp.firstIndex(of: dp.max()!)!
        sb.append(words[idx])
        while pre[idx] != idx {
            idx = pre[idx]
            sb.insert(words[idx], at: 0)
        }

        return sb
    }


    private func calHanmingDis(of words:[String]) -> [[Int]] {
        let wordsToChars = words.map { [Character]($0)}
        let N = words.count
        var hanmingDis = [[Int]](repeating: [Int](repeating: 20, count: N), count: N)

        for i in 0..<N {
            hanmingDis[i][i] = 0
            var j = i + 1
            while j < N {
                if words[i].count == words[j].count {
                    let M = words[i].count
                    var dis = 0
                    for p in 0..<M {
                        if wordsToChars[i][p] != wordsToChars[j][p] {
                            dis += 1
                        }
                    }
                    hanmingDis[i][j] = dis
                    hanmingDis[j][i] = dis
                }
                j += 1
            }
        }
        return hanmingDis
    }

}

