// https://leetcode.com/problems/non-negative-integers-without-consecutive-ones/
class Solution {
    private var memo = [Int:Int]()
    private var upperBound = [Int]()
    private var base: Int = -1
    func findIntegers(_ n: Int) -> Int {
        self.memo = [:]
        self.base = 2
        self.upperBound = caculateUpperBound(of: n, 2)
        return dfs(self.upperBound.count - 1, 0, 0)
    }
    private func caculateUpperBound(of num: Int, _ base: Int) -> [Int] {
        var ans = [Int]()
        var n = num
        while n > 0 {
            ans.append(n % base)
            n /= base
        }
        return ans
    }
    private func dfs(_ curPos: Int, _ preNum: Int, _ targetMax: Int) -> Int {
        guard curPos >= 0 else {
            return 1
        }
        let key = (curPos << 32) | (preNum & 1)
        if preNum < targetMax && preNum != 0 {
            guard nil == memo[key] else {
                return memo[key]!
            }
        }
        let limit = preNum < targetMax ? 1 : self.upperBound[curPos]
        var ret = 0
        for num in 0...limit {
            if num == 0 || (preNum & 1 == 0) {
                ret += dfs(curPos - 1, preNum * self.base + num , targetMax * self.base + self.upperBound[curPos])
            }
        }
        if preNum < targetMax && preNum != 0 {
            self.memo[key] = ret
        }
        return ret
    }
}

// Solution().findIntegers(6)

