//https://leetcode.com/problems/longest-mountain-in-array/
class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        guard A.count >= 3 else {
            return 0
        }
        var ans = Int.min
        for i in 1..<A.count {
            var j = i
            while j >= 1 && A[j] > A[j - 1] {
                j -= 1
            }
            if j == i {
                continue
            }
            var k = i
            while k < (A.count  - 1) && A[k + 1] < A[k]  {
                k += 1
            }
            if k == i {
                continue
            }
            ans = max(ans, k - j + 1)
        }
        return ans ==  Int.min ? 0 : ans
    }
}