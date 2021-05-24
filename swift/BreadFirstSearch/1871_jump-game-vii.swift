// https://leetcode.com/problems/jump-game-vii/
class Solution {
    func canReach(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
        let chars = [Character](s)
        let length = s.count
        guard chars[length - 1] == "0" else {
            return false
        }
        let target = length - 1
        var queue = [0]
        var l = -1
        var r = -1
        while !queue.isEmpty {
            var nextLevel = [Int]()
            for idx in queue {
                l = max(r, idx + minJump)
                r = max(r, min(length - 1, idx + maxJump))
                if target >= l && target <= r {
                    return true
                }
                if l <= r {
                    for i in l...r {
                        if chars[i] == "0" {
                            nextLevel.append(i)
                        }
                    }
                }
                
            }
            queue = nextLevel
        }
        return false
    }
}

