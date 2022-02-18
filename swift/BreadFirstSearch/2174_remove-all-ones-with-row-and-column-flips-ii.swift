//  https://leetcode.com/problems/remove-all-ones-with-row-and-column-flips-ii/
class Solution {
    func removeOnes(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        let targetState = [Int](repeating: 0, count: M)
        let initiateState = grid.map {getState(of: $0)}
        guard initiateState != targetState else {return 0}
        
        var queue = [[Int]]()
        queue.append(initiateState)
        var visited = Set<Int>()
        visited.insert(initiateState.hashValue)
        var steps = 0
        while !queue.isEmpty {
            print(queue)
            steps += 1
            var nextLevel = [[Int]]()
            for state in queue {
                
                for r in 0..<M {
                    guard state[r] != 0 else {continue}
                    
                    for c in 0..<N {
                        guard state[r] & (1 << c) != 0 else {continue}
                        var newState = state
                        newState[r] = 0
                        newState = newState.map { $0 & ~(1 << c)}
                        guard newState != targetState else {
                            // print("\(r) \(c)")
                            return steps
                        }
                        let hash = newState.hashValue
                        guard !visited.contains(hash) else {continue}
                        visited.insert(hash)
                        nextLevel.append(newState)
                    }
                }
            }
            queue = nextLevel
        }
        return 0
    }
    
    private func getState(of row: [Int]) -> Int {
        var ans = 0
        for idx in 0..<row.count {
            if row[idx] == 1 {
                ans |= (1 << idx)
            }
        }
        return ans
    }
}