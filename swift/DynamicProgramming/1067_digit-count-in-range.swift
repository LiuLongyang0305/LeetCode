// https://leetcode.com/problems/digit-count-in-range/
class Solution {
    private typealias Info = (total:Int,cnt:Int)
    func digitsCount(_ d: Int, _ low: Int, _ high: Int) -> Int {
        return digitsCount(of: d, lessThan: high) - digitsCount(of: d, lessThan: low - 1)
    }
    
    private func digitsCount(of d:Int, lessThan num: Int) -> Int {
        guard num >= 0 else {
            return 0
        }
        
        let upperBounds = caculateUpperBound(of: num, 10)
        var memo = Array<Info>(repeating: (-1,-1), count: upperBounds.count + 1)
        return dfs(upperBounds.count - 1, 0, 0, &memo, upperBounds: upperBounds, of: d).cnt
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
    
    private func dfs(_ curPos: Int,_ preNum: Int, _ targetNum: Int,_  memo: inout [Info], upperBounds: [Int], of d: Int ) -> Info {
        guard curPos >= 0 else {
            return (1,0)
        }
        if preNum < targetNum && preNum != 0 && memo[curPos] != (-1,-1) {
            return memo[curPos]
        }
        let limit = preNum < targetNum ? 9 : upperBounds[curPos]
        var ret: Info = (0,0)
        for num in 0...limit {
            let info = dfs(curPos - 1, preNum * 10 + num, targetNum * 10 + upperBounds[curPos], &memo, upperBounds: upperBounds, of: d)
            
            ret.total += info.total
            if d != 0 {
                ret.cnt += (num == d ? info.total : 0) + info.cnt
            } else {
                ret.cnt += (num == d && preNum != 0 ? info.total : 0) + info.cnt
            }
        }
        if preNum < targetNum && preNum != 0 {
            memo[curPos] = ret
        }
        return ret
    }
}
