    // https://leetcode.cn/problems/count-substrings-with-k-frequency-characters-ii/
    class Solution {
        func numberOfSubstrings(_ s: String, _ k: Int) -> Int {
            let chars = [Character](s)
            let M = chars.count
            var ans = 0
            var counter = [Character:Int]()
            var l = 0
            var r = 0
            while  l < M {
                while r < M && (counter.values.max() ?? 0) < k {
                    counter[chars[r],default: 0] += 1
                    r += 1
                }
                if (counter.values.max() ?? 0) >= k {
                    ans += M - (r - 1)
                }
                counter[chars[l],default: 0] -= 1
                l += 1
            }
            return ans
        }
    }
