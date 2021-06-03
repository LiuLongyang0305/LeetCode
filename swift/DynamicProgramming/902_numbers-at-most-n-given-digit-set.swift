// https://leetcode.com/problems/numbers-at-most-n-given-digit-set/
class Solution {
    
    private var memo = [Int:Int]()
    private var upperBound = Array<Int>()
    private var digits = [Int]()
    
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        
        self.upperBound = caculateUpperBound(of: n)
        self.memo = [:]
        self.digits = digits.map { Int($0)!}
        
        return dfs(0, self.upperBound.count - 1 , 0)
    }
    
    private func dfs(_ preNum: Int,_ curPos: Int, _ targetMax: Int ) -> Int {
                
        guard curPos >= 0 else {
            return 1
        }
        
        let key = curPos << 32 | (preNum < targetMax && preNum != 0 ? 1 : 0)
        guard nil == self.memo[key] else {
            return self.memo[key]!
        }
        let maxNum = preNum < targetMax ? 9 : self.upperBound[curPos]
        
        var curDigits = digits
        if preNum == 0 && curPos != 0 {
            curDigits.append(0)
        }
        var ret = 0
        for num in curDigits  {
            guard num <= maxNum else {
                continue
            }
            ret += dfs(preNum * 10 + num, curPos - 1, targetMax * 10 + self.upperBound[curPos])
        }
        if preNum < targetMax && preNum != 0 {
            self.memo[key] = ret
        }
        return ret
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
}


