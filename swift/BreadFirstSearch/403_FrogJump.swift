// https://leetcode.com/problems/frog-jump/
class Solution {
    
    private struct State: Hashable {
        var pos:Int
        var lastStep: Int
    }
    
    func canCross(_ stones: [Int]) -> Bool {
        guard stones[1] == 1 else {
            return false
        }
        guard stones.count > 2 else {
            return true
        }
        
        let stonesPositions = Set<Int>(stones)
        
        let anotherSide = stones.last!
        var visited = Set<State>()
        var queue = [State]()
        let startState = State(pos: 1, lastStep: 1)
        visited.insert(startState)
        queue.append(startState)
        while !queue.isEmpty {
            var nextLevel = [State]()
            for cur in queue {
                for nextStep in [cur.lastStep - 1, cur.lastStep + 1, cur.lastStep] {
                    guard nextStep > 0 else {
                        continue
                    }
                    let nextPos = cur.pos + nextStep
                    guard nextPos != anotherSide else  {
                        return true
                    }
                    if stonesPositions.contains(nextPos) {
                        let nextState = State(pos: nextPos, lastStep: nextStep)
                        if !visited.contains(nextState) {
                            visited.insert(nextState)
                            nextLevel.append(nextState)
                        }
                    }
                }
                
            }
            queue = nextLevel
        }
        return false
    }
}
Solution().canCross([0,1,3,5,6,8,12,17])
