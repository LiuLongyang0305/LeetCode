//https://leetcode.com/problems/best-sightseeing-pair/
class Solution {
    func maxScoreSightseeingPair(_ A: [Int]) -> Int {
        guard A.count > 2 else {
            return A[0]  + A[1] - 1
        }
        var sum = Array<Int>(repeating: 0, count: A.count)
        sum[0] =  A[0]
        for i in 1..<A.count {
            sum[i] = max(sum[i  - 1], A[i] + i)
        }
        var sub = Array<Int>(repeating: 0, count: A.count)
        sub[A.count  - 1] = A.last! - A.count +  1
        for i in (0..<(A.count - 1)).reversed() {
            sub[i] = max(sub[i + 1], A[i] - i)
        }
        print(sub)
        print(sum)
        var ans = Int.min
        ans = max(ans, sum[0] + sub[1])
        ans = max(ans, sum[A.count -  2] + sub[A.count - 1])
        for i in 1..<A.count - 1 {
            ans =  max(ans, sub[i] + sum[i - 1], sum[i]  +  sub[i + 1])
        }
        return ans
    }
}

class Solution2 {
    func maxScoreSightseeingPair(_ A: [Int]) -> Int {
        var ans = 0
        var preMax = A[0]
        for i in 1..<A.count {
            ans = max(ans, preMax + A[i] - i)
            preMax = max(preMax, A[i] + i)
        }
        return ans
    }
}