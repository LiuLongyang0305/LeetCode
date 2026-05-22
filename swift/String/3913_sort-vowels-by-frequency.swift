   //https://leetcode.cn/problems/sort-vowels-by-frequency/
    class Solution {
        let vowels: Set<Character> = ["a","e","i","o","u"]
        func sortVowels(_ s: String) -> String {
            var chars = [Character](s)
            var conter = [Character:(firstIdx:Int,cnt:Int)]()
            for i in 0..<chars.count {
                if vowels.contains(chars[i]) {
                    if var sb = conter[chars[i]] {
                        sb.cnt += 1
                        conter[chars[i]] = sb
                    } else {
                        conter[chars[i]] = (i,1)
                    }
                }
            }
            if conter.count < 2 {return s}
            let sortedCounter = conter.sorted { p1, p2 in
                if p1.value.cnt == p2.value.cnt {
                    return p1.value.firstIdx < p2.value.firstIdx
                }
                return p1.value.cnt > p2.value.cnt
            }
            var idx = 0
            var remain = sortedCounter[idx].value.cnt
            for i in 0..<chars.count {
                if vowels.contains(chars[i]) {
                    if remain == 0 {
                        idx += 1
                        remain = sortedCounter[idx].value.cnt
                    }
                    chars[i] = sortedCounter[idx].key
                    remain -= 1
                }
            }
            return String(chars)
        }
    }
