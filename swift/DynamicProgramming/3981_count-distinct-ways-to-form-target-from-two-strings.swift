// https://leetcode.cn/problems/count-distinct-ways-to-form-target-from-two-strings/
class Solution {
    private let MOD = 1_000_000_007
    func interleaveCharacters(_ word1: String, _ word2: String, _ target: String) -> Int {
        let w2cs1 = [Character](word1)
        let M = word1.count
        let w2cs2 = [Character](word2)
        let N = word2.count
        let t2cs = [Character](target)
        let P = target.count

        var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: P + 1), count: N + 1), count: M + 1)

        func dfs(tIdx:Int,  w1Idx: Int, w2Idx: Int) -> Int {
            guard tIdx < P else {return 1}
            if -1 != memo[w1Idx][w2Idx][tIdx] {
                return memo[w1Idx][w2Idx][tIdx]
            }
            // guard M - w1Idx + N - w2Idx >= P - tIdx else {
            //     return 0
            // }
            var sb = 0
            let tch = t2cs[tIdx]
            //从w1里面选
            var i = w1Idx
            while i < M {
                if w2cs1[i] == tch {
                    sb += dfs(tIdx: tIdx + 1, w1Idx: i + 1, w2Idx: w2Idx)
                    sb %= MOD
                }
                i += 1
            }
            //从w2里面选
            i = w2Idx
            while i < N {
                if w2cs2[i] == tch {
                    sb += dfs(tIdx: tIdx + 1, w1Idx: w1Idx, w2Idx: i + 1)
                    sb %= MOD
                }
                i += 1
            }
            memo[w1Idx][w2Idx][tIdx] = sb
            return sb
        }
        return (dfs(tIdx: 0, w1Idx: 0, w2Idx: 0) - calChoosedFromOneWord(w2cs1, t2cs) - calChoosedFromOneWord(w2cs2, t2cs) + MOD) % MOD
    }


    private func calChoosedFromOneWord(_ word: [Character], _ target: [Character]) -> Int {
        let M = word.count
        let N = target.count
        var memo = [[Int]](repeating: [Int](repeating: -1, count: N + 1), count: M + 1)

        func dfs(_ tIdx:Int, _ wIdx: Int) -> Int {
            guard tIdx < N else {return 1}
            guard wIdx < M else {return 0}
            if -1 != memo[wIdx][tIdx] {
                return memo[wIdx][tIdx]
            }
            // guard M - wIdx >= N - tIdx else {return 0}
            var sb = 0
            var i = wIdx
            while i < M {
                if word[i] == target[tIdx] {
                    sb += dfs(tIdx + 1, i + 1)
                    sb %= MOD
                }
                i += 1
            }
            memo[wIdx][tIdx] = sb
            return sb
        }
        return dfs(0, 0)
    }
}

