// https://leetcode.com/problems/maximize-score-after-n-operations/
class Solution {
    private let leftShiftResults: [Int] = (0..<14).map { 1 << $0}
    func maxScore(_ nums: [Int]) -> Int {
        
        let N = nums.count
        let maxTime = N >> 1
        var gcdResults = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: N)
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                let ans = gcd(nums[i], nums[j])
                gcdResults[i][j] = ans
                gcdResults[j][i] = ans
            }
        }
        var memo = [Int:Int]()
        func dpSolve(_ visited: Int, _ time: Int) -> Int {
            guard time <= maxTime else {
                return 0
            }
            if let s = memo[visited] {
                return s
            }
            var tempScore = 0
            for i in 0..<(N - 1) {
                guard visited & leftShiftResults[i] == 0 else {
                    continue
                }
                for j in (i + 1)..<N {
                    guard visited & leftShiftResults[j] == 0 else {
                        continue
                    }
                    tempScore = max(tempScore, time * gcdResults[i][j]  + dpSolve(visited | leftShiftResults[i] | leftShiftResults[j], time + 1))
                }
            }
            memo[visited] = tempScore
            return tempScore
        }
        return dpSolve(0,1)
    }
    @inline(__always) private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return a % b == 0 ? b : gcd(b, a % b)
    }
}