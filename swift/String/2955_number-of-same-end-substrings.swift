//https://leetcode.cn/problems/number-of-same-end-substrings/
    class Solution {
        func sameEndSubstringCount(_ s: String, _ queries: [[Int]]) -> [Int] {
            let chars = [Character](s)
            let M = s.count
            var preffix = [[Character:Int]](repeating: [:], count: M + 1)
            var counter = [Character:Int]()
            for i in 0..<M {
                counter[chars[i],default: 0] += 1
                preffix[i + 1] = counter
            }


            func solve(_ l: Int, _ r: Int) -> Int {
                var cnt = 0
                let (rightCounter,leftCounter) = (preffix[r + 1], preffix[l])
                for (c,v) in rightCounter {
                    let v2 = leftCounter[c] ?? 0
                    let curCharCnt = v - v2
                    cnt += curCharCnt * (curCharCnt + 1) / 2
                }
                return cnt
            }
            return queries.map { solve($0[0], $0[1]) }
        }
    }

