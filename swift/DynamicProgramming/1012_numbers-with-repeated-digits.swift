//https://leetcode.com/problems/numbers-with-repeated-digits/
class Solution {
    private var memo = [Int:Int]()
    private var upperBound = [Int]()
    
    func numDupDigitsAtMostN(_ n: Int) -> Int {
        
        self.upperBound = caculateUpperBound(of: n)
        self.memo = [:]
        
        return n - dfs(self.upperBound.count - 1, 0, 0,0) + 1
    }
    
    private func caculateUpperBound(of num: Int) -> [Int] {
        var ans = [Int]()
        var n = num
        while n > 0 {
            ans.append(n % 10)
            n /= 10
        }
        return ans
    }
    
    private func dfs(_ curPos: Int, _ preNum: Int, _ targetMax: Int, _ usedDigits: Int) -> Int {
        guard curPos >= 0 else {
            return 1
        }
        let key =  (usedDigits << 32) | curPos
        if preNum < targetMax && preNum != 0 {
            guard nil == self.memo[key] else {
                return self.memo[key]!
            }
        }
        let upperLimit = preNum < targetMax ? 9 : self.upperBound[curPos]
        var ret = 0
        for num in 0...upperLimit {
            //保证没有使用过
            if usedDigits & (1 << num) == 0 {
                ret += dfs(curPos - 1, preNum * 10 + num, targetMax * 10 + self.upperBound[curPos], preNum + num == 0 ? 0 : (usedDigits | (1 << num)) )
            }
        }
        if preNum < targetMax && preNum != 0 {
            self.memo[key] = ret
        }
//        print(ret)
        return ret
    }
}

Solution().numDupDigitsAtMostN(6752989)

