// https://leetcode.com/problems/bulb-switcher-iv/
class Solution {
    private enum BulbState {
        case off,on
        mutating func overturn() {
            switch self {
            case .off:
                self = .on
            case .on:
                self = .off
            }
        }
    }
    func minFlips(_ target: String) -> Int {
        var ans = 0
        let targetArr = target.map { $0 == "0" ? BulbState.off : BulbState.on}
        var curState = BulbState.off
        for s in targetArr {
            if s !=  curState {
                ans += 1
                curState.overturn()
            }
        }
        return ans
    }
}

