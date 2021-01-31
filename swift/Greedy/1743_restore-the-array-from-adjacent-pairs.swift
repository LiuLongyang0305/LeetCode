// https://leetcode.com/problems/restore-the-array-from-adjacent-pairs/
class Solution {
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        guard adjacentPairs.count > 1 else {
            return adjacentPairs[0]
        }
        let N = adjacentPairs.count + 1
        
        var ans = [Int]()
        var map = [Int: [Int]]()
        for ap in adjacentPairs {
            map[ap[0],default: []].append(ap[1])
            map[ap[1],default: []].append(ap[0])
        }
        var visited = Set<Int>()
        for (v,neighbors) in map {
            if neighbors.count == 1 {
                ans.append(v)
                ans.append(neighbors[0])
                visited.insert(v)
                visited.insert(neighbors[0])
                break
            }
        }
        while ans.count < N {
            
            if let last = ans.last, let neighbors = map[last] {
                neighbors.forEach { (v) in
                    if !visited.contains(v) {
                        ans.append(v)
                        visited.insert(v)
                    }
                }
            }
        }
        return ans
    }
}