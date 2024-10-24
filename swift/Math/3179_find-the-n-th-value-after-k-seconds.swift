//https://leetcode.cn/problems/find-the-n-th-value-after-k-seconds/
class Solution {
    private let MOD = 1_000_000_007
    func valueAfterKSeconds(_ n: Int, _ k: Int) -> Int {
        var last = [Int](repeating: 1, count: n)
        for _ in 1...k {
            var cur = [1]
            for num in last.dropFirst() {
                cur.append((num + cur.last!) % MOD)
            }
            last = cur
        }
        return last.last!
    }
}