    // https://leetcode.cn/problems/maximize-sum-after-at-most-k-digit-rearrangements/
    class Solution {
        private struct Pair:Comparable {
            static func < (lhs: Solution.Pair, rhs: Solution.Pair) -> Bool {
                lhs.delta < rhs.delta
            }

            init(ori: Int, sorted: Int) {
                self.ori = ori
                self.sorted = sorted
                self.delta = sorted - ori
            }

            var ori:Int
            var sorted:Int
            let delta:Int
        }
        func maximizeSum(_ nums: [Int], _ k: Int) -> Int {
            var heap = Heap<Pair>()
            var ans = nums.reduce(0) { $0 + $1}
            for num in nums {
                let v = getSortedNum(of: num)
                if v - num > 0 {
                    heap.insert(Pair(ori: num, sorted: v))
                }
            }
            var remain = k
            while let top =  heap.popMax(), remain > 0 {
                ans += top.delta
                remain -= 1
            }
            return ans
        }

        private func getSortedNum(of num: Int) -> Int {
            var digits = [Int]()
            var t = num
            while t > 0 {
                digits.append(t % 10)
                t /= 10
            }
            digits.sort { $0 > $1}
            var ans = 0
            for digit in digits {
                ans = 10 * ans + digit
            }
            return ans
        }

    }
