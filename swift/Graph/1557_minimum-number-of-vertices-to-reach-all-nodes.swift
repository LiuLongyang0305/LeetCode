// https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/
class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var ans = Set<Int>(0..<n)
        for edge in edges {
            ans.remove(edge[1])
        }
        return [Int](ans)
    }
}