//https://leetcode.com/problems/length-of-longest-fibonacci-subsequence/
extension Array where Element == Int {
    func mapNumToIndex() -> [Int:Int] {
        var ans: [Int:Int] = [:]
        for i in 0..<count {
            ans[self[i]] = i
        }
        return ans
    }
}
class Solution {
    func lenLongestFibSubseq(_ A: [Int]) -> Int {
        var ans = 0
        let length = A.count
        let numToIndex = A.mapNumToIndex()
        let maxEle = A.last!
        var visited = Set<[Int]>()
        
        func constructFibonacciSubsequence(_ first: Int, _ second: Int, _ length: Int)  {
            guard let index = numToIndex[first + second] else {
                ans = max(ans, length)
                return
            }
            visited.insert([second,A[index]])
            constructFibonacciSubsequence(second, A[index], length  + 1)
        }
        
        for i in 0..<(length - 2) {
            for j in (i + 1)..<(length - 1) {
                if A[i] + A[j] <= maxEle {
                    if let index = numToIndex[A[i] + A[j]] {
                        if !visited.contains([A[i],A[j]]) {
                            visited.insert([A[i],A[j]])
                            constructFibonacciSubsequence(A[j], A[index], 3)
                        }
                    }
                }
            }
        }
        return ans
    }
}