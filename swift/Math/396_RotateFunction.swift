//https://leetcode.com/problems/rotate-function/
class Solution {
    func maxRotateFunction(_ A: [Int]) -> Int {
        guard A.count > 1 else {
            return 0
        }
        var ans = Int.min
        let length = A.count
        var rel = 0
        var sum = 0
        for i in 0..<length {
            rel += i * A[i]
            sum += A[i]
        }
        ans = max(ans, rel)
        for i in 1..<length {
            rel += sum - length * A[length - i]
            ans = max(ans, rel)
        }
        return ans
    }
}