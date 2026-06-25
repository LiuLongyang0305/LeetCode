// https://leetcode.cn/problems/find-the-count-of-good-integers/
        class Solution {
            var factorial:[Int] = [Int](repeating: 1, count: 11)
            var bases = [Int](repeating: 1, count: 11)
            init() {
                for i in 1...10 {
                    factorial[i] = factorial[i - 1] * i
                    bases[i] = bases[i - 1] * 10
                }
            }
            func countGoodIntegers(_ n: Int, _ k: Int) -> Int {
                var ans = 0
                var visited = Set<String>()

                let half = (n - 1) / 2
                let start = bases[half]
                for i in stride(from: start, to: start * 10, by: 1) {
                    var s = "\(i)"
                    s += String(s.dropLast(n % 2).reversed())
                    guard let num = Int(s), num % k == 0 else  {
                        continue
                    }
                    let sortedS = String(s.sorted())
                    guard !visited.contains(sortedS) else {continue}
                    visited.insert(sortedS)
                    var cnt = [Int](repeating: 0, count: 10)
                    for ch in s {
                        cnt[Int(ch.asciiValue!) - 48] += 1
                    }
                    var res = (n - cnt[0]) * factorial[n - 1]
                    for c in cnt {
                        res /= factorial[c]
                    }
                    ans += res
                }

                return ans
            }
        }
