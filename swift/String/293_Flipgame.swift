// https://leetcode.com/problems/flip-game/
class Solution {
    func generatePossibleNextMoves(_ s: String) -> [String] {
        guard s.count > 1 else {
            return []
        }
        var ans = [String]()
        var chars = [Character](s)
        let N = s.count
        for i in 0..<( N - 1) {
            if chars[i] == "+" && chars[i + 1] == "+" {
                chars[i] = "-"
                chars[i + 1] = "-"
                ans.append(String(chars))
                chars[i] = "+"
                chars[i + 1] = "+"
            }
        }
        return ans
    }
}
