// https://leetcode.com/problems/count-special-integers/
class Solution {
    func countSpecialNumbers(_ n: Int) -> Int {
        let upperBound = caculateUpperBound(of: n, 10)
        let N = upperBound.count
        var memo = [Int:Int]()
        func  dfs(_ curPos: Int, _ preNum: Int, _ targetMax:Int, _ visited: Int) -> Int {
            guard curPos < N else {
                return 1
            }
            let key = visited << 40 | (curPos << 20) | (preNum < targetMax && preNum != 0 ? 1 : 0)
            if let v = memo[key] {
                return v
            }
            let rightLimit = preNum < targetMax ? 9 : upperBound[curPos]
            var ans = 0
            for digit in 0...rightLimit {
                guard visited & (1 << digit) == 0 else {continue}
                let visited = preNum * 10 + digit == 0 ? 0 : (visited | (1 << digit))
                ans += dfs(curPos + 1, preNum * 10 + digit, targetMax * 10 + upperBound[curPos], visited)
            }
            if preNum < targetMax && preNum != 0 {
                memo[key] = ans
            }
            return ans
        }
        return dfs(0, 0, 0, 0) - 1
    }
    private func caculateUpperBound(of num: Int, _ base: Int) -> [Int] {
        var ans = [Int]()
        var n = num
        while n > 0 {
            ans.append(n % base)
            n /= base
        }
        return ans.reversed()
    }
}