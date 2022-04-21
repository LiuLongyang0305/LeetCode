// https://leetcode.com/problems/cracking-the-safe/
class Solution {
    var visited = Set<String>()
    private var k: Int = -1
    private var ans = ""
    func crackSafe(_ n: Int, _ _k: Int) -> String {
        self.k = _k
        let start = String(repeating: "0", count: n - 1)
        dfs(start)
        return ans + start
    }
    private func dfs(_ last: String) {
        let N = last.count
        for i in 0..<k {
            let next = last + "\(i)"
            if !visited.contains(next) {
                visited.insert(next)
                dfs(String(next.suffix(N)))
                ans += "\(i)"
            }
        }
    }
}