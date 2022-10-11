// https://leetcode.com/problems/using-a-robot-to-print-the-lexicographically-smallest-string/
class Solution {
    func robotWithString(_ s: String) -> String {
        var ans = ""
        let sChars = [Character](s)
        let N = sChars.count

        var nextMinEleIndices = [Int](repeating: -1, count: N)
        nextMinEleIndices[N - 1] = N - 1
        for idx in stride(from: N - 2, through: 0, by: -1) {
            nextMinEleIndices[idx] = sChars[idx] <= sChars[nextMinEleIndices[idx + 1]] ? idx : nextMinEleIndices[idx + 1]
        }
        // print(nextMinEleIndices)
        var t = ""
        for idx in 0..<N {
            while !t.isEmpty && t.last! <= sChars[nextMinEleIndices[idx]] {
                ans.append(t.removeLast())
            }
            t.append(sChars[idx])
        }
        if !t.isEmpty {
            ans += String(t.reversed())
        }
        return ans
    }
}