// https://leetcode.com/problems/sum-of-scores-of-built-strings/
class Solution {

    private let base = 131
    private let MOD = 1_000_000_007
    private let M = 1_000_05
    private var powers = [Int]()

    init() {
        powers = [Int](repeating: 1, count: M)
        var i = 1
        while i < M {
            powers[i] = powers[i - 1] * base % MOD
            i += 1
        }
    }
    
    func sumScores(_ s: String) -> Int {
        let chars = [Character](s)
        let N = chars.count
        var preffixHash = [Int](repeating: 0, count: N + 1)
        for i in 1...N {
            preffixHash[i] = (preffixHash[i - 1] * base + Int(chars[i - 1].asciiValue!)) % MOD
        }


        //求某段的哈希值
        func getHash(_ head: Int, _ length: Int) -> Int {
            return ((preffixHash[head + length] - preffixHash[head] * powers[length]) % MOD + MOD) % MOD
        }


        var ans = 0
        //枚举子串长度
        var length = 1
        while length <= N {

            let head = N - length
            //Binary search
            var left = 0
            var right = length
            while left < right {
                let mid = (left + right + 1) >> 1
                if getHash(head, mid) == getHash(0, mid) {
                    left = mid
                }  else {
                    right = mid - 1
                }
            }
            ans += left
            length += 1
        }

        return ans
    }
}