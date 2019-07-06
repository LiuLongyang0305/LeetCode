//https://leetcode.com/problems/sum-of-even-numbers-after-queries/
class Solution {
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var result = [Int]()
        var originalEvenSum = 0
        var evenIndices = Set<Int>()
        for i in 0..<A.count {
            if A[i] % 2 == 0 {
                originalEvenSum += A[i]
                evenIndices.insert(i)
            }
        }
        var ACopy = A
        for query in queries {
            let index = query[1]
            let targetValue = query[0] + ACopy[index]
            
            if targetValue % 2 == 0 {
                if evenIndices.contains(index) {
                    originalEvenSum -= ACopy[index]
                    originalEvenSum += targetValue
                } else {
                    originalEvenSum += targetValue
                    evenIndices.insert(index)
                }
            } else {
                if evenIndices.contains(index) {
                    originalEvenSum -= ACopy[index]
                    evenIndices.remove(index)
                }
            }
            result.append(originalEvenSum)
            ACopy[index] = targetValue
        }
        return result
    }
}
