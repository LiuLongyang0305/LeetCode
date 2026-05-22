//https://leetcode.cn/problems/sort-integers-by-binary-reflection/
    class Solution {
        func sortByReflection(_ nums: [Int]) -> [Int] {
            return nums.sorted { i, j in
                let m = cal(i)
                let n = cal(j)
                if (m == n) {
                    return i < j
                }
                return m < n
            }
        }
        private func cal(_ num: Int) -> Int {
            var sb = 0
            var t = num
            while t > 0 {
                sb *= 2
                sb += t & 1
                t /= 2
            }
            return sb
        }
    }
