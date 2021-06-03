// https://leetcode-cn.com/problems/number-of-2s-in-range-lcci/
class Solution {
    private typealias Info = (total: Int,cnt: Int)
    private var memo = [Info]()
    private var upperBound = [Int]()
    
    func numberOf2sInRange(_ n: Int) -> Int {
        
        self.upperBound = caculateUpperBound(of: n)
        self.memo = Array<Info>(repeating: (-1,-1), count: 15)
        
        return dfs(self.upperBound.count - 1, 0, 0).cnt
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
    
    private func dfs(_ curPos: Int, _ preNum: Int, _ targetMax: Int) -> Info {
        
        guard curPos >= 0 else {
            return (1,0)
        }
        if preNum < targetMax && preNum != 0 && memo[curPos] != (-1,-1){
            return memo[curPos]
        }
        let up = preNum < targetMax ? 9 : self.upperBound[curPos]
        
        var ret: Info = (0,0)
        
        for num in 0...up {
            let info = dfs(curPos - 1, preNum * 10 + num, targetMax * 10 + self.upperBound[curPos])
            ret.total += info.total
            ret.cnt += (num == 2 ? info.total : 0) + info.cnt
            
        }
        if preNum < targetMax && preNum != 0 {
            memo[curPos] = ret
        }
        return ret
    }
}
