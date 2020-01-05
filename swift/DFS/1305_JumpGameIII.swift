//https://leetcode.com/problems/jump-game-iii/
class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var visited = Array<Bool>(repeating: false, count: arr.count)
        visited[start] = true
        var cannotReachPositions = Set<Int>()
        func dfs(_ position: Int) -> Bool{
            guard arr[position] != 0 else {
                return true
            }
            for p in [position + arr[position],position - arr[position]] {
                if p >= 0 && p < arr.count && !visited[p] && !cannotReachPositions.contains(p){
                    visited[p] = true
                    if dfs(p) {
                        return true
                    }
                    visited[p] = false
                }
            }
            cannotReachPositions.insert(position)
            return false
        }
        return dfs(start)
    }
 }

