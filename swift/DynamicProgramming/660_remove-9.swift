// https://leetcode.com/problems/remove-9/
class Solution {
    private struct State: Hashable {
        var curPos: Int
        var isStrictLessThan: Bool
        var isZero: Bool
    }
    func newInteger(_ n: Int) -> Int {
        var left = 1
        var right = Int.max >> 1
        while left < right {
            let mid = (left + right) >> 1
            let cnt = countNumbersContainDigit9(mid)
            if cnt < n {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    
    func countNumbersContainDigit9(_ target: Int)  -> Int{
        
        let upperBounds = getUpperBounds(of: target)
        var memo = [State: Int]()
        
        func helper(_ preNum: Int, _ targetNum: Int, _ curPos: Int) -> Int {
            guard curPos >= 0 else {
                return (preNum >= 1 && preNum <= target) ? 1 : 0
            }
            let isStrictLessThanTarget = preNum < targetNum
            
            let key = State(curPos: curPos, isStrictLessThan: isStrictLessThanTarget,isZero: preNum == 0)
            if let c = memo[key] {
                return c
            }
            
            var ret = 0
            let maxDigit = isStrictLessThanTarget ? 8 : min(8, upperBounds[curPos])
            let minDigit =  (preNum == 0 && curPos == 0) ? 1 : 0
            
            for digit in minDigit...maxDigit {
                ret += helper(preNum * 10 + digit, targetNum * 10 + upperBounds[curPos], curPos - 1)
            }
            memo[key] = ret
            
            
            return ret
        }
        return helper(0, 0, upperBounds.count - 1)
    }
    
    private func getUpperBounds(of num: Int) -> [Int] {
        var ans = [Int]()
        var t = num
        while t > 0 {
            ans.append(t % 10)
            t /= 10
        }
        return ans
    }
}