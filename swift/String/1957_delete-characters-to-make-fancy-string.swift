 // https://leetcode.com/problems/delete-characters-to-make-fancy-string/
class Solution {
    func makeFancyString(_ s: String) -> String {
        var ans = [Character]()
        var cnt = 0
        for ch in s {
            if cnt < 2 {
                ans.append(ch)
                cnt += 1
            } else {
                if ch == ans[cnt - 1] && ch == ans[cnt - 2] {
                    continue
                }
                cnt += 1
                ans.append(ch)
            }
        }
        return String(ans)
    }
}