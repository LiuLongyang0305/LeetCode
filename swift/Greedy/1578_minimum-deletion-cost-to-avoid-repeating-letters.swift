// https://leetcode.com/problems/minimum-deletion-cost-to-avoid-repeating-letters/
class Solution {
    func minCost(_ s: String, _ cost: [Int]) -> Int {
        let N = s.count
        guard N > 1 else {
            return 0
        }
        var ans = 0
        func update(_ indices: [Int]) {
            guard indices.count > 1 else {
                return
            }
            let sunStr = cost[indices.first!...indices.last!]
            ans += sunStr.reduce(0) { $0 + $1} - sunStr.max()!
        }
        let chars = [Character](s)
        var last = [Int]()
        for i in 0..<N {
            if last.isEmpty {
                last.append(i)
            } else {
                if chars[i] != chars[last.last!] {
                    update(last)
                    last = [i]
                } else {
                    last.append(i)
                }
            }
        }
        update(last)
        return ans
    }
}