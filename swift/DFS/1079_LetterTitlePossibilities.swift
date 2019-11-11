//https://leetcode.com/problems/letter-tile-possibilities/
class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var ans = Set<String>()
        let chars = Array<Character>(tiles)
        let length = tiles.count
        func dfs(_ currentStr:inout String,_ visited: inout [Bool]) {
            if !currentStr.isEmpty {
                ans.insert(currentStr)
            }
            for i in 0..<length {
                if !visited[i] {
                    currentStr.append(chars[i])
                    visited[i] = true
                    dfs(&currentStr, &visited)
                    currentStr.removeLast()
                    visited[i] = false
                }
            }
        }
        var visited = Array<Bool>(repeating: false, count: length)
        for i in 0..<length {
            var str = "\(chars[i])"
            if !ans.contains(str) {
                visited[i] = true
                dfs(&str, &visited)
                visited[i] = false
            }
        }
        return ans.count
    }
}