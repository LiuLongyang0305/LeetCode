//https://leetcode.com/problems/partition-array-to-minimize-xor/
class Solution {
    private let INF = Int.max / 2
    func minXor(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        var prefix = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            prefix[i + 1] = prefix[i] ^ nums[i]
        }

        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: k + 5), count: N + 5)
        func dfs(_ pos: Int, _ remainK: Int) -> Int {
            if remainK == 1 {
                return prefix[N] ^ prefix[pos]
            }
            if let sb = memo[pos][remainK] {
                return sb
            }
            var sb =  INF
            for j in stride(from: pos + 1, to: N - remainK + 2, by: 1) {
                sb = min(sb,max(prefix[j] ^ prefix[pos], dfs(j, remainK - 1)))
            }
            memo[pos][remainK] = sb
            return sb
        }
        return dfs(0, k)
    }
}
