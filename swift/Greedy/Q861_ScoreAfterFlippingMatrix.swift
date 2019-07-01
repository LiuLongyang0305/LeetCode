//https://leetcode.com/problems/score-after-flipping-matrix/
class Solution {
    func matrixScore(_ A: [[Int]]) -> Int {
        var ACopy = A
        var ans = 0
        var countOneEachCol = Array<Int>(repeating: 0, count: A[0].count)
        for row in 0..<A.count {
            for col in 0..<A[0].count {
                if A[row][col] == 1 {
                    countOneEachCol[col] += 1
                }
            }
        }
        
        for row in 0..<A.count {
            if A[row][0] != 1 {
                for col in 0..<A[row].count {
                    ACopy[row][col] = A[row][col] == 0 ? 1 : 0
                    countOneEachCol[col] += A[row][col] == 0 ? 1 : -1
                }
            }
        }
        
        for col in 1..<A[0].count {
            var countZero = 0
            var countOne = 0
            for row in 0..<A.count {
                if ACopy[row][col] == 0 {
                    countZero += 1
                } else {
                    countOne += 1
                }
            }
            if countOne < countZero {
//                for row in 0..<A.count {
//                    ACopy[row][col] = ACopy[row][col] == 0 ? 1 : 0
//                }
                countOneEachCol[col] = countOneEachCol[col] - countOne + countZero
            }
        }
        var i = 0
        while i < A[0].count {
            ans = ans * 2 + countOneEachCol[i]
            i += 1
        }
        return ans
    }
}
