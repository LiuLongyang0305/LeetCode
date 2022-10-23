// https://leetcode.com/problems/number-of-sets-of-k-non-overlapping-line-segments/
class Solution1 {
    private let MOD = 1_000_000_007
    private enum NodeState: Int {
        case YES = 1
        case NO = 2
    }
    func numberOfSets(_ n: Int, _ k: Int) -> Int {

        var memo = [Int:Int]()
        func dfs(_ idx: Int, _ segCnt: Int, _ startHere: NodeState) -> Int {
            guard segCnt > 0 else {return 1}
            guard idx < n else {return 0}
            let key = (idx << 30) | (segCnt << 20) | startHere.rawValue
            if let ans = memo[key] {
                return ans
            }
            var ans = dfs(idx + 1, segCnt, startHere)
            if startHere == .YES {
                ans += dfs(idx + 1, segCnt, .NO)
            } else {
                ans += dfs(idx, segCnt - 1, .YES)
            }
            ans %= MOD
            memo[key] = ans
            return ans
        }
        return dfs(0, k, .YES)
    }
}

class Solution {
    private let MOD = 1_000_000_007
    private enum NodeState: Int {
        case skip = 1
        case start = 2
        case middle = 4
    }
    func numberOfSets(_ n: Int, _ k: Int) -> Int {



        var memo = [Int:Int]()

        func  dfs(_ idx: Int, _ segCnt: Int,_ lastIdxState: NodeState) -> Int {
            guard segCnt > 0 else {return 1}
            guard idx < n else {return 0}
            let key = (idx << 30) | (segCnt << 20) | lastIdxState.rawValue
            guard nil == memo[key] else {return memo[key]!}
            var ans = 0
            switch lastIdxState {
                case .skip:
                    ans += dfs(idx + 1, segCnt, .skip)
                    ans += dfs(idx + 1, segCnt, .start)
                    break

                case .start:
                    ans += dfs(idx + 1, segCnt, .middle)
                    ans += dfs(idx, segCnt - 1, .skip)
                    break
                case .middle:
                    ans += dfs(idx + 1, segCnt, .middle)
                    ans += dfs(idx, segCnt - 1, .skip)
                    break

            }
            ans %= MOD
            memo[key] = ans
            return ans
        }

        return dfs(0, k,.skip )
    }
}