//https://leetcode.com/problems/valid-mountain-array/
class Solution {
    func validMountainArray(_ A: [Int]) -> Bool {
        guard A.count > 2 else {
            return false
        }
        var i = 1
        while i < A.count && A[i] > A[i - 1] {
            i += 1
        }
        if i == A.count || i == 1{
            return false
        }
        var j = A.count - 2

        while j >= 0 && A[j + 1] < A[j] {
            j -= 1
        }
        return i - 1 == j + 1
    }
}