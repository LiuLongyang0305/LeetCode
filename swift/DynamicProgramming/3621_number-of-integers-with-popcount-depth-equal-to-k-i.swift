 //https://leetcode.com/problems/number-of-integers-with-popcount-depth-equal-to-k-i/
 func getDepth(of num: Int) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    return 1 + getDepth(of: num.nonzeroBitCount)
}
let depth = (0...51).map { getDepth(of: $0)}
class Solution {
    
   
    private struct KeyNode: Hashable {
        var pos: Int
        var isLessThan: Bool
        var targetOneBitCnt:Int
    }
    
    func popcountDepth(_ n: Int, _ k: Int) -> Int {
        
        guard k > 0 else {return 1}
        
        let digits =  getDigits(of: n)
        let N = digits.count
        
        if k == 1 {
            return N - 1
        }
        
        var memo = [KeyNode:Int]()
        
        func dfs(_ pos: Int, _ isLessThan: Bool, _ targetOneBitCnt: Int) -> Int {
            
            guard pos < N else {
                return targetOneBitCnt == 0 ? 1 : 0
            }
            guard targetOneBitCnt >= 0 else {return 0}
            
            let key = KeyNode(pos: pos, isLessThan: isLessThan, targetOneBitCnt: targetOneBitCnt)
            if let sb = memo[key] {
                return sb
            }
            var sb = 0
            let hi = isLessThan ? 1 : digits[pos]
            var i = 0
            while i <= hi {
                sb += dfs(pos + 1, isLessThan ||  i < digits[pos] ,targetOneBitCnt - i)
                i += 1
            }
            memo[key] = sb
            return sb
        }
        var sb = 0
        for i in 0...51 {
            if depth[i] == k {
                sb += dfs(0, false, i)
            }
        }
        return sb
    }
    
    private func getDigits(of num: Int) -> [Int] {
        var sb = [Int]()
        var t = num
        while t > 0 {
            sb.append(t & 1)
            t /= 2
        }
        return [Int](sb.reversed())
    }
}
