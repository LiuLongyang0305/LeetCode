// https://leetcode.com/problems/defuse-the-bomb/
class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        guard k != 0 else {
            return Array<Int>(repeating: 0, count: code.count)
        }
        let N = code.count
        var ans = [Int]()
        let codeCopy = code + code
        var prefix = codeCopy
        for i in 1..<(2 * N) {
            prefix[i] += prefix[i - 1]
        }
        if k > 0 {
            for i in 0..<N {
                ans.append(prefix[i + k] - prefix[i])
            }
        } else {
            for idx in N..<(N * 2) {
                ans.append(prefix[idx - 1] - prefix[idx + k - 1])
            }
        }
        return ans
    }
}

