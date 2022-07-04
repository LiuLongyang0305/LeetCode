// https://leetcode.com/problems/number-of-people-aware-of-a-secret/
class Solution {
    private let MOD = 1_000_000_007
    func peopleAwareOfSecret(_ n: Int, _ delay: Int, _ forget: Int) -> Int {
        var last = [Int](repeating: 0, count: forget)
        last[0] = 1
        for _ in 2...n {
            var new = last
            new.removeLast()
            let total = new.dropFirst(delay - 1).reduce(0) { ($0 + $1) % MOD}
            new.insert(total, at: 0)
            last = new
        }
        return last.reduce(0) {($0 + $1) % MOD}
    }
}
