// https://leetcode.com/problems/count-triplets-that-can-form-two-arrays-of-equal-xor/
class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        guard arr.count > 1 else {
            return 0
        }
        var ans = 0
        var dp: [Int] = [arr[0]]
        let N = arr.count
        for i in 1..<N {
            dp.append(dp.last! ^ arr[i])
        }
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                for k in j..<N {
                    if dp[i] ^ dp[j - 1] ^ arr[i] == dp[k] ^ dp[j] ^ arr[j] {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}


