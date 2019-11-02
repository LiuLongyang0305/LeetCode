//https://leetcode.com/problems/longest-turbulent-subarray/
class Solution {
    func maxTurbulenceSize(_ A: [Int]) -> Int {
        guard A.count > 1 else {
            return A.count
        }
        guard A.count > 2 else {
            return A[0] != A[1] ? 2 : 1
        }
        var ans = Int.min
        var last = A[0] > A[1]  ? 1 : A[0] == A[1] ? 0 : -1
        var tempLength = -1
        if last != 0 {
            tempLength = 2
        } else {
            tempLength = 1
        }
        for i in 1..<(A.count - 1) {
            let current =  A[i] > A[i + 1]  ? 1 : A[i] == A[i + 1] ? 0 : -1
            if  current * last == -1 {
                tempLength +=  1
            } else {
                ans = max(ans, tempLength)
                tempLength = current != 0 ? 2 : 1
            }
            last =  current
        }
        return max(ans, tempLength)
    }
}