// https://leetcode.com/problems/flip-game-ii/
class Solution {
    private var map = [[Character]:Bool]()
    private var N = -1
    func canWin(_ s: String) -> Bool {
        map = [:]
        N = s.count
        return helper(chars: [Character](s))
    }
    
    private func helper(chars: [Character]) -> Bool {
        guard nil == map[chars] else {
            return map[chars]!
        }
        var i = 1
        while i < N {
            if chars[i] == "+" && chars[i - 1] == "+" {
                var charsCopy = chars
                charsCopy[i] = "-"
                charsCopy[i - 1] = "-"
                if !helper(chars: charsCopy) {
                    map[chars] = true
                    return true
                }

            }
            i += 1
        }
        map[chars] = false
        return false
    }
}
