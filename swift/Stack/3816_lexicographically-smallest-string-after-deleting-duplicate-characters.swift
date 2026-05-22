   //https://leetcode.cn/problems/lexicographically-smallest-string-after-deleting-duplicate-characters/


    class Solution {
        func lexSmallestAfterDeletion(_ s: String) -> String {
            var remain = [Character:Int]()
            for ch in s {remain[ch,default: 0] += 1}
            var st = [Character]()
            for ch in s {
                while let l = st.last, l > ch && remain[l]! > 1 {
                    remain[l,default: 0] -= 1
                    st.popLast()
                }
                st.append(ch)
            }
            while let l = st.last, remain[l]! > 1 {
                remain[l,default: 0] -= 1
                st.popLast()
            }
            return String(st)
        }
    }
