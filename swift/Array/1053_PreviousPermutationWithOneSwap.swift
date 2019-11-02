//https://leetcode.com/problems/previous-permutation-with-one-swap/
class Solution {
    func prevPermOpt1(_ A: [Int]) -> [Int] {
        var i = A.count - 2
        while i >= 0{
            if A[i]  - A[i + 1] > 0 {
                break
            }
            i -= 1
        }
        guard i != -1 else {
            return A
        }
        
        var ans = A
        var j = i + 1
        var targetIndex = -1
        while j < A.count {
            if A[j] < A[i] {
                if A[j] == A[i] - 1 {
                    ans.swapAt(i, j)
                    return ans
                }
                if  targetIndex == -1 {
                    targetIndex = j
                } else {
                    if A[j] > A[targetIndex] {
                        targetIndex = j
                    }
                }
            }
            j += 1
        }
        ans.swapAt(i, targetIndex)
        return  ans
    }
}