// https://leetcode.com/problems/longest-happy-string/
class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        return longestDiverseString(a, b, c, "a", "b", "c")
    }
    private func longestDiverseString(_ a: Int, _ b: Int, _ c: Int, _ aa: Character,  _ bb : Character, _ cc: Character) -> String {
        guard a >= b else {
            return longestDiverseString(b, a, c, bb, aa, cc)
        }
        guard b >= c else {
            return longestDiverseString(a, c, b, aa, cc, bb)
        }
        guard b != 0 else {
            return String(repeating: aa, count: min(2, a))
        }
        let use_a = min(2, a)
        let use_b = a - use_a >= b ? 1 : 0
        
        return String(repeating: aa, count: use_a) + String(repeating: bb, count: use_b) + longestDiverseString(a - use_a, b - use_b, c, aa, bb, cc)
    }
}