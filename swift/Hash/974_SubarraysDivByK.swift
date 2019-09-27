// https://leetcode.com/problems/subarray-sums-divisible-by-k/
class Solution {
    func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
        let length = A.count
        var ans = 0
        var sum = Array<Int>(repeating: 0, count: length + 1)
        for i in 0..<length {
            sum[i + 1] = sum[i] + A[i]
        }
        var count = Array<Int>(repeating: 0, count: K)
        for ele in sum {
            count[(ele % K + K)  % K] += 1
        }
        for c in count {
            ans += (c - 1) * c / 2
        }
        return ans
    }
}