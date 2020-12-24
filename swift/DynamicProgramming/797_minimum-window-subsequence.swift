// https://leetcode.com/problems/minimum-window-subsequence/
class Solution {
    func minWindow(_ S: String, _ T: String) -> String {
        let N = S.count
        let SToNumber = S.map { Int($0.asciiValue! - 97)}
        let TToNumber = T.map { Int($0.asciiValue! - 97)}
        var last = Array<Int>(repeating: -1, count: 26)
        var next = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: 26), count: N)
        var windows = Array<Array<Int>>()
        for i in stride(from: N - 1, through: 0, by: -1) {
            last[SToNumber[i]] = i
            for k  in 0..<26 {
                next[i][k] = last[k]
            }
            if SToNumber[i] == TToNumber[0] {
                windows.insert([i,i], at: 0)
            }
        }
        let M = T.count
        let windowsSize = windows.count
        var j = 1
        while j < M {
            let letterIndex = TToNumber[j]
            for  k in 0..<windowsSize {
                if windows[k][1] < N - 1 && next[windows[k][1] + 1][letterIndex] >= 0 {
                    windows[k][1] = next[windows[k][1] + 1][letterIndex]
                } else {
                    windows[k] = [-1,-1]
                    break
                }
            }
            j += 1
        }
        var ans = [-1,S.count]
        for window in windows {
            guard window[0] != -1 else {
                break
            }
            if window[1] - window[0] < ans[1] - ans[0] {
                ans = window
            }
        }
        return ans[0] >= 0 ? String(S[S.index(S.startIndex, offsetBy: ans[0])...S.index(S.startIndex, offsetBy: ans[1])]) : ""
    }
}
