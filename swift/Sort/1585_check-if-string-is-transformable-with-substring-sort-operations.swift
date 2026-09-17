    // https://leetcode.cn/problems/check-if-string-is-transformable-with-substring-sort-operations/
    class Solution {
        func isTransformable(_ s: String, _ t: String) -> Bool {
            var indices = [[Int]](repeating: [], count: 10)
            let sChars = [Character](s)
            for i in 0..<sChars.count {
                let idx = Int(sChars[i].asciiValue!) - 48
                indices[idx].append(i)
            }
            for ch in t {
                let digit = Int(ch.asciiValue!) - 48
                guard !indices[digit].isEmpty else {
                    return false
                }

                let i = indices[digit].removeFirst()
                var j = 0
                while j < digit {
                    if let k = indices[j].first, k < i {
                        return false
                    }
                    j += 1
                }
            }
            return true
        }
    }
