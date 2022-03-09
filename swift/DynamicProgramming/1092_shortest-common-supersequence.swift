// https://leetcode.com/problems/shortest-common-supersequence/
class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let chars1 = [Character](str1)
        let chars2 = [Character](str2)
        
        let M = str1.count
        let N = str2.count
        
        var memo = [[[Character]?]](repeating: [[Character]?](repeating: nil, count: N), count: M)
        
        func dfs(_ idx1: Int, _ idx2: Int) -> [Character] {
            guard idx1 < M && idx2 < N else {return []}
            guard nil == memo[idx1][idx2] else {return memo[idx1][idx2]!}
            var ans = [Character]()
            if chars1[idx1] == chars2[idx2] {
                ans.append(chars2[idx2])
                ans += dfs(idx1 + 1, idx2 + 1)
            } else {
                let s1 = dfs(idx1 + 1, idx2)
                let s2 = dfs(idx1, idx2 + 1)
                
                ans = s1.count > s2.count ? s1 : s2
            }
            memo[idx1][idx2] = ans
            return ans
        }
        
        let lcs = dfs(0, 0)
        
        var lcsIdx = 0
        var chars1Idx = 0
        var chars2Idx = 0
        let P = lcs.count
        var ans = ""
        while lcsIdx < P {
            while chars1Idx < M && chars1[chars1Idx] != lcs[lcsIdx] {
                ans.append(chars1[chars1Idx])
                chars1Idx += 1
            }
            
            
            while chars2Idx < N && chars2[chars2Idx] != lcs[lcsIdx] {
                ans.append(chars2[chars2Idx])
                chars2Idx += 1
            }
            ans.append(lcs[lcsIdx])
            chars1Idx += 1
            chars2Idx += 1
            lcsIdx += 1
        }
        
        if chars1Idx < M {
            ans.append(contentsOf: chars1[chars1Idx...])
        }
        if chars2Idx < N {
            ans.append(contentsOf: chars2[chars2Idx...])
        }
        return ans
    }
}