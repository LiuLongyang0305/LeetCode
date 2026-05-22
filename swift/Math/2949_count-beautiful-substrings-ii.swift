 // https://leetcode.cn/problems/count-beautiful-substrings-ii/
    class Solution {
        private let volwes: Set<Character> = ["a","e","i","o","u"]
        func beautifulSubstrings(_ s: String, _ k: Int) -> Int {
            let chars = [Character](s)
            var map = [Int:[Int:Int]]()
            var curSum = 0
            map[0,default: [:]][0] = 1
            let modValueForIdx = cal(k)
            var sb = 0
            for i in 1...chars.count {
                curSum += (volwes.contains(chars[i - 1]) ? 1 : -1)
                if let v = map[curSum]?[i % modValueForIdx] {
                    sb += v
                }
                map[curSum,default: [:]][i % modValueForIdx,default: 0] += 1
            }
            return sb
        }

        private func cal(_ k: Int) -> Int {
            var a = 0
            var x = 0
            for i in stride(from: 31, through: 1, by: -1) {
                if k % (i * i) == 0 {
                    a = i
                    x = k / (i * i)
                    break
                }
            }
            return 2 * a * x
        }
    }
