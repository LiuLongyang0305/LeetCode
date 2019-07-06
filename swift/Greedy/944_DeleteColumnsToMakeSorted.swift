//https://leetcode.com/problems/delete-columns-to-make-sorted/
class Solution {
    func minDeletionSize(_ A: [String]) -> Int {
        
        var matrix = [[UInt8]]()
        var count = 0
        for str in A {
            let arr = Array<UInt8>(str.utf8)
            matrix.append(arr)
        }
        var j = 0
        while j < A[0].count {
            for i in 1..<A.count {
                if matrix[i][j] < matrix[i - 1][j] {
                    count += 1
                    break
                }
            }
            j += 1
        }

       return count
    }
}
