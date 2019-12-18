// https://leetcode.com/problems/largest-sum-of-averages/
 class Solution1 {
    func largestSumOfAverages(_ A: [Int], _ K: Int) -> Double {
        guard K != 1 else {
            return A.reduce(0.0) {$0 + Double($1) } / Double(A.count)
        }
        guard K != A.count else {
            return Double(A.reduce(0, { $0 + $1}))
        }
        let N  = A.count
        var memo = Array<Array<Double>>(repeating: Array<Double>(repeating: 0.0, count: N + 1), count: N + 1)
        let doubleA = A.map { Double($0)}
        var currentSum = 0.0
        for index in 0..<N {
            currentSum += doubleA[index]
            memo[index + 1][1] = currentSum / Double(index + 1)
        }
        
        func search(_ size: Int,_ groupsCount: Int) -> Double {
            guard memo[size][groupsCount] == 0.0 else {
                return memo[size][groupsCount]
            }
            guard size >= groupsCount else {
                return  0.0
            }
            var currentSum = 0.0
            var index  = size - 1
            while index > 0 {
                currentSum += doubleA[index]
                memo[size][groupsCount] = max(memo[size][groupsCount], search(index, groupsCount - 1) + currentSum / Double(size - index))
                index -= 1
            }
            return memo[size][groupsCount]
        }
        return search(N, K)
    }
 }
 
 class Solution2 {
    func largestSumOfAverages(_ A: [Int], _ K: Int) -> Double {
        guard K != 1 else {
            return A.reduce(0.0) {$0 + Double($1) } / Double(A.count)
        }
        guard K != A.count else {
            return Double(A.reduce(0, { $0 + $1}))
        }
        let N  = A.count
        let doubleA = A.map {Double($0)}
        var preSum = Array<Double>(repeating: 0, count: N)
        for index in 0..<N {
            preSum[index] = doubleA[index] + (index != 0 ? preSum[index  - 1] :  0.0)
        }
        var dp = Array<Array<Double>>(repeating: Array<Double>(repeating: 0.0, count: K + 1), count: N)
        for groups in 1...K {
            for start in 0...(N - groups) {
                if groups == 1 {
                    dp[start][groups] = (preSum[N - 1] - preSum[start] + doubleA[start]) / Double(N - start)
                    continue
                }
                for end in start...(N - groups) {
                    dp[start][groups] = max(dp[start][groups], dp[end + 1][groups - 1] + (preSum[end] - preSum[start] + doubleA[start]) / Double(end - start +  1))
                }
            }
        }
        return dp[0][K]
    }
 }
 class Solution {
    func largestSumOfAverages(_ A: [Int], _ K: Int) -> Double {
        guard K != 1 else {
            return A.reduce(0.0) {$0 + Double($1) } / Double(A.count)
        }
        guard K != A.count else {
            return Double(A.reduce(0, { $0 + $1}))
        }
        let N  = A.count
        let doubleA = A.map {Double($0)}
        var preSum = Array<Double>(repeating: 0, count: N)
        for index in 0..<N {
            preSum[index] = doubleA[index] + (index != 0 ? preSum[index  - 1] :  0.0)
        }
        var dp = Array<Double>(repeating: 0.0, count: N)
        for groups in 1...K {
            for start in 0...(N - groups) {
                if groups == 1 {
                    dp[start] = (preSum[N - 1] - preSum[start] + doubleA[start]) / Double(N - start)
                    continue
                }
                for end in start...(N - groups) {
                    dp[start] = max(dp[start], dp[end + 1] + (preSum[end] - preSum[start] + doubleA[start]) / Double(end - start +  1))
                }
            }
        }
        return dp[0]
    }
 }
 let arr = [9,1,2,3,9]
 let K = 3
 Solution().largestSumOfAverages(arr, 3)
