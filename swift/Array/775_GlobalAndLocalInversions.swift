//https://leetcode.com/problems/global-and-local-inversions/
class Solution {
    func isIdealPermutation(_ A: [Int]) -> Bool {
        guard A.count > 2 else {
            return  true
        }
        for i in 0..<(A.count - 1) {
            if A[i + 1] > A[i] {
                if A[i]  >  i {
                    return false
                }
            } else {
                if A[i]  > i + 1 {
                    return false
                }
            }
        }
        return true
    }
}