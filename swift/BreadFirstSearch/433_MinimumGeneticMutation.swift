// https://leetcode.com/problems/minimum-genetic-mutation/
class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        guard bank.contains(end) else {
            return -1
        }
        let startChars = [Character](start)
        let endChars = [Character](end)
        let bankChars = bank.map { [Character]($0)}
        
        var visited = Set<[Character]>()
        visited.insert(startChars)
        var depth = 0
        var queue = [[Character]]()
        
        queue.append(startChars)
        
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [[Character]]()
            for cur in queue {
                for next in bankChars {
                    var cnt = 0
                    guard !visited.contains(next) else {
                        continue
                    }
                    for i in 0..<8 {
                        if next[i] != cur[i] {
                            cnt += 1
                        }
                    }
                    guard cnt == 1 else {
                        continue
                    }
                    guard next != endChars else {
                        return depth
                    }
                    visited.insert(next)
                    nextLevel.append(next)
                }
                
            }
            queue = nextLevel
        }
        return -1
    }
}