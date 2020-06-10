// https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/
class Solution {
    func permutation(_ s: String) -> [String] {
        var ans = Set<String>()
        let N = s.count
        let chars = [Character](s)
        var visited = Array<Bool>(repeating: false, count: N)
        func dfs(_ cur:  String) {
            guard cur.count < N  else {
                ans.insert(cur)
                return
            }
            for i in 0..<N {
                if !visited[i] {
                    visited[i] = true
                    dfs(cur + "\(chars[i])")
                    visited[i] = false
                }
            }
        }
        dfs("")
        return [String](ans)
    }
}