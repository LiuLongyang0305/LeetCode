// https://leetcode.com/problems/maximum-number-of-groups-getting-fresh-donuts/
class Solution {
    private struct State:Hashable {
        var remain:[Int:Int]
        var rest: Int
    }
    func maxHappyGroups(_ batchSize: Int, _ _groups: [Int]) -> Int {
        guard batchSize != 1 else {
            return _groups.count
        }
        var M = 0
        var counter = [Int:Int]()
        for group in _groups {
            let t = group % batchSize
            if t == 0 {
                M += 1
            } else {
                counter[t,default: 0 ] += 1
            }
        }
        var memo = [State: Int]()
        func helper(_ counter: [Int:Int],_ rest: Int) -> Int {
            guard !counter.isEmpty else {
                return 0
            }
            let key = State(remain: counter , rest: rest)
            if let c = memo[key] {
                return c
            }
            var ans = 0
            for (need,cnt) in counter {
                var newCounter = counter
                if cnt == 1 {
                    newCounter.removeValue(forKey: need)
                } else {
                    newCounter[need] = cnt - 1
                }
                if rest == 0 {
                    ans = max(ans, 1 + helper(newCounter, batchSize - need))
                } else {
                    ans = max(ans, helper(newCounter, rest + (rest >= need ? 0 : batchSize) - need))
                }
            }
            memo[key] = ans
            return ans
        }
        return M + helper(counter, 0)
    }
}