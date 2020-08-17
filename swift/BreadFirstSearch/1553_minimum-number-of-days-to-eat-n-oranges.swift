// https://leetcode.com/problems/minimum-number-of-days-to-eat-n-oranges/
class Solution {
    
    func minDays(_ n: Int) -> Int {
        guard n > 2 else {
            return n
        }
        var visited = Set<Int>()
        visited.insert(n)
        var queue = [Int]()
        queue.append(n)
        var depth = 0
        
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [Int]()
            for r in queue {
                if r % 3 == 0 {
                    let nextRemain = r / 3
                    guard nextRemain > 2 else {
                        return depth + nextRemain
                    }
                    if !visited.contains(nextRemain) {
                        nextLevel.append(nextRemain)
                        visited.insert(nextRemain)
                    }
                }
                if r % 2 == 0 {
                    let nextRemain = r >> 1
                    guard nextRemain > 2 else {
                        return depth + nextRemain
                    }
                    if !visited.contains(nextRemain) {
                        nextLevel.append(nextRemain)
                        visited.insert(nextRemain)
                    }
                }
                let nextRemain = r - 1
                guard nextRemain > 2 else {
                    return depth + nextRemain
                }
                if !visited.contains(nextRemain) {
                    nextLevel.append(nextRemain)
                    visited.insert(nextRemain)
                }
            }
            queue = nextLevel.sorted()
        }
        return -1
    }
}