//https://leetcode.cn/problems/merge-close-characters-ii
class Solution {
        func mergeCharacters(_ s: String, _ k: Int) -> String {
            var map = [Character:Int]()
            var sb = ""
            var curIdx = 0
            for ch in s {
                if let lastIdx = map[ch] {
                    if curIdx - lastIdx > k {
                        sb.append(ch)
                        map[ch] = curIdx
                        curIdx += 1
                    }
                } else {
                    sb.append(ch)
                    map[ch] = curIdx
                    curIdx += 1
                }
            }

            return sb
        }
    }
