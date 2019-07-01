//https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/
class Solution {
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        var numbersCount = Array<Int>(repeating: 0, count: 7)
        var numberCountInA = Array<Int>(repeating: 0, count: 7)
        var numbersCountInB = Array<Int>(repeating: 0, count: 7)
        for i in 0..<A.count {
            if A[i] != B[i] {
                numbersCount[A[i]] += 1
                numbersCount[B[i]] += 1
            } else {
                numbersCount[A[i]] += 1
            }
            numberCountInA[A[i]] += 1
            numbersCountInB[B[i]] += 1

        }
        
        let maxCount = numbersCount.max()!
        if maxCount < A.count {
            return -1
        }
        
        let index = numbersCount.firstIndex(of: maxCount)!
       return  min(numberCountInA[index], A.count - numberCountInA[index], numbersCountInB[index], A.count - numbersCountInB[index])
    }
}

