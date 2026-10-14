    // https://leetcode.cn/problems/filter-characters-by-frequency/
    class Solution {
        func filterCharacters(_ s: String, _ k: Int) -> String {
            var counter = [Character:Int]()
            for ch in s {
                counter[ch,default: 0] += 1
            }
            var sb = ""
            for ch in s {
                if counter[ch]! >= k {continue}
                sb.append(ch)
            }
            return sb
        }
    }
