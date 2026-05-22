//https://leetcode.cn/problems/count-palindromic-subsequences/
class Solution {
    private let MOD = 1_000_000_007
    func countPalindromes(_ s: String) -> Int {
        let (preCnt,preAbCnt) = cal(s)
        var (suffCnt,suffAbCnt) = cal(String(s.reversed()))
        suffCnt.reverse()
        suffAbCnt.reverse()
        var sb = 0
        for middle in 0..<s.count {
            for (ab,c) in preAbCnt[middle] {
                let rightHalf = suffAbCnt[middle + 1]
                sb += c * (rightHalf[ab] ?? 0)
                sb %= MOD

            }
        }
        return sb % MOD
    }

    private func cal(_ s: String) -> ([[Int:Int]],[[Int:Int]]) {
        let N = s.count
        let digits = s.map { Int($0.asciiValue!) - 48}
        var preCnt = [[Int:Int]](repeating: [:], count: N + 1)
        var preABCnt = [[Int:Int]](repeating: [:], count: N + 1)
        for i in 0..<N {
            var cnt = preCnt[i]
            var abCnt = preABCnt[i]
            for (d,c) in cnt {
                abCnt[10 * d + digits[i],default:0] += c
            }
            cnt[digits[i],default: 0] += 1
            preCnt[i + 1] = cnt
            preABCnt[i + 1] = abCnt
        }
        return (preCnt,preABCnt)
    }
}
