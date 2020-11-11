// https://leetcode.com/problems/freedom-trail/
class Solution {
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        var map = [Character:[Int]]()
        ring.enumerated().forEach {map[$0.element,default: []].append($0.offset)}
        let keyChars = [Character](key)
        let N = ring.count
        var memo = [[Int]:Int]()
        func backtracking(_ idx: Int, _ last: Int) -> Int {
            guard idx < key.count else {
                return 0
            }
            guard let nextPotentialPositions = map[keyChars[idx]] else {
                return 0
            }
            let curKey = [last,idx]
            guard nil == memo[curKey] else {
                return memo[curKey]!
            }
            var ans = Int.max
            for np in nextPotentialPositions {
                let needSteps = backtracking(idx + 1, np)
                var step = abs(last - np)
                step = min(N - step, step)
//                print("last = \(last)  step = \(step)   neddStep = \(needSteps)")
                ans = min(ans,step + needSteps)
            }
            memo[curKey]  = ans
            return ans
        }
        return backtracking(0,0) + key.count
    }
}