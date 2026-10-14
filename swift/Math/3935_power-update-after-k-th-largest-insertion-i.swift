    // https://leetcode.cn/problems/power-update-after-k-th-largest-insertion-i/
    class Solution {
        func powerUpdate(_ nums: [Int], _ p: Int, _ queries: [[Int]]) -> [Int] {
            var sortedList = [Int.max / 2]  +  nums.sorted(by: { $0 > $1}) + [-1]
            func binarySearchFirstSmallerThanOrEqualTo(_ target: Int) -> Int {
                var l = 0
                var r = sortedList.count - 1
                while l < r {
                    let mid = (l + r) >> 1
                    if sortedList[mid] <= target {
                        r = mid
                    } else {
                        l = mid + 1
                    }
                }
                return l
            }

            var curP = p
            var sb = [Int](repeating: 0, count: queries.count)
            for i in 0..<queries.count {
                let (v,k) = (queries[i][0],queries[i][1])
                sortedList.insert(v, at: binarySearchFirstSmallerThanOrEqualTo(v))
                curP = _fastPowerRecursion(curP, sortedList[k], 1_000_000_007)
                curP %= 1_000_000_007
                sb[i] = curP
            }
            return sb
        }

        func _fastPowerRecursion(_ base: Int, _ exp: Int,_ mod: Int) -> Int {
            guard exp > 0 else {return 1}
            var t = _fastPowerRecursion(base, exp >> 1,mod)
            t = t * t % mod
            return (0 == exp & 1) ? t : (t * base % mod)
        }
    }
