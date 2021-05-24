// https://leetcode.com/problems/coin-path/
extension Array : Comparable where Element: Comparable {
    public static func < (lhs: Array<Element>, rhs: Array<Element>) -> Bool {
        let minLength = Swift.min(lhs.count,rhs.count)
        var idx = 0
        while idx < minLength {
            if lhs[idx] != rhs[idx] {
                return lhs[idx] < rhs[idx]
            }
            idx += 1
        }
        return lhs.count <= rhs.count
    }
    
}

class Solution {
    func cheapestJump(_ coins: [Int], _ maxJump: Int) -> [Int] {
        guard coins.last! != -1 else {
            return []
        }
        var path = Array<Array<Int>>(repeating: [], count: coins.count)
        var dp = Array<Int>(repeating: Int.max, count: coins.count)
        dp[0] = coins[0]
        path[0] = [0]
        var idx = 1
        while idx < coins.count {
            if coins[idx] != -1  {
                
                
                var left = max(idx - maxJump, 0)
                var temp = Int.max
                var curPath = [Int.max]
                while left < idx {

                    if dp[left] != Int.max {
                        let cost = dp[left] + coins[idx]
                        if cost < temp {
                            temp = dp[left] + coins[idx]
                            curPath = path[left] + [idx]
                        } else if temp == cost {
                            let p = path[left] + [idx]
                            if p < curPath {
                                curPath = p
                            }
                        }
                    }
                    left += 1
                }
                dp[idx] = temp
                path[idx] = curPath
            }
            idx += 1
        }
        guard dp.last! != Int.max else {
            return []
        }
        return path.last!.map { $0 + 1}
    }
}