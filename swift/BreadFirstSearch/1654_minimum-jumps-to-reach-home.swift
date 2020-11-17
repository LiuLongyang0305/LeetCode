// https://leetcode.com/problems/minimum-jumps-to-reach-home/
class Solution {
    private struct State: Hashable {
        var pos:Int
        var isTowards: Bool
    }
    func minimumJumps(_ forbidden: [Int], _ a: Int, _ b: Int, _ x: Int) -> Int {
        guard x != 0 else {
            return 0
        }
        let forbiddenSet = Set<Int>(forbidden)
        let maxX = a >= b ? x + b : x + 4000;
        guard !forbiddenSet.contains(a) else {
            return -1
        }
        guard x != a else {
            return 1
        }
        var visited = Set<State>()
        var queue = [State]()
        let startState = State(pos: a, isTowards: true)
        queue.append(startState)
        visited.insert(startState)
        var step = 1
        var nextLevel = [State]()
        func update(_ nextP: Int, _ isTowards: Bool) -> Bool{
            guard nextP >= 0  && nextP <= maxX else {
                return false
            }
            guard !forbiddenSet.contains(nextP) else {
                return false
            }
            guard nextP != x else {
                return true
            }
            let s = State(pos: nextP, isTowards: isTowards)
            guard !visited.contains(s) else {
                return false
            }
            visited.insert(s)
            nextLevel.append(s)
            return false
        }
        while !queue.isEmpty {
            step += 1
            nextLevel = [State]()
            for s in queue {
                if update(s.pos + a, true) {
                    return step
                }
                if s.isTowards {
                    if update(s.pos - b, false) {
                        return step
                    }
                }
            }
            queue = nextLevel
        }
        
        return -1
    }
}