// https://leetcode.com/problems/range-product-queries-of-powers/
class Solution {

    private let powerOfTwo = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824]
    private let MOD = 1_000_000_007

    func productQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var powers = [Int]()

        func dfs(_ num: Int) {

            if let idx = powerOfTwo.lastIndex(where: { $0 <= num}) {
                powers.insert(powerOfTwo[idx], at: 0)
                dfs(num - powerOfTwo[idx])
            }
        }

        dfs(n)

        return queries.map { boundry in
            var ans = 1
            for idx in boundry[0]...boundry[1] {
                ans = ans * powers[idx] % MOD
            }
            return ans
        }
    }
}