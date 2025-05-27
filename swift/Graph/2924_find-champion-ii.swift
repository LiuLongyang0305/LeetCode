//https://leetcode.com/problems/find-champion-ii/
class Solution {
    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var inDgree = [Int](repeating: 0, count: n)
        for edge in edges {
            inDgree[edge[1]] += 1
        }
        if let f = inDgree.firstIndex(of: 0), let s = inDgree.lastIndex(of: 0), f == s {
            return f
        }
        return -1
    }
}
