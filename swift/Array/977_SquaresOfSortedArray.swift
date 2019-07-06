//https://leetcode.com/problems/squares-of-a-sorted-array/
class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var result = [Int]()
        if A[0] >= 0 {
            for ele in A {
                result.append(ele * ele)
            }
            return result
        }
        if A[A.count - 1] <= 0 {
            for ele in A {
               result.insert(ele * ele, at: 0)
            }
             return result
        }
        var i = 0
        var j = A.count - 1
        while i <= j {
            let a = abs(A[i])
            let b = abs(A[j])
            if a < b {
                result.insert(b * b, at: 0)
                j -= 1
            } else {
                result.insert(a * a, at: 0)
                i += 1
            }
        }
        return result
    }
}