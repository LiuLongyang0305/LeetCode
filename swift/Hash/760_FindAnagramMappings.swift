// https://leetcode.com/problems/find-anagram-mappings/
class Solution {
    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        let N = A.count
        var ans = Array<Int>(repeating: -1, count: N)
        var visited = Array<Bool>(repeating: false, count: N)
        for i in 0..<N {
            for j in 0..<N {
                if B[j] == A[i] && !visited[j] {
                    ans[i] = j
                    visited[j] = true
                    break
                }
            }
        }
        return ans
    }
}