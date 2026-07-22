    // https://leetcode.cn/problems/subsequence-after-one-replacement/
    class Solution {
        func canMakeSubsequence(_ s: String, _ t: String) -> Bool {
            let M = s.count
            guard M <= s.count else {return false}
            let sChars = [Character](s)
            var f0 = 0//在不修改的前提下，s[0..<j0]是t的当前前缀当前的子序列
            var f1 = 0//修改一次的前提下，s[0..<j1]是t的当前前缀当前的子序列
            for ch in t {
                //f1普通匹配
                if sChars[f1] == ch {
                    f1 += 1
                }
                //强行修改schars[f0]强行匹配
                f1 = max(f1,f0 + 1)
                //f0普通匹配
                if sChars[f0] == ch {
                    f0 += 1
                }
                if f1 == M || f0 == M {
                    return true
                }
            }
            return false
        }
    }
