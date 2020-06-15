// https://leetcode.com/problems/minimum-number-of-days-to-make-m-bouquets/
class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        guard bloomDay.count >= m * k else {
            return -1
        }
        var right = Int.min
        var left = Int.max
        bloomDay.forEach { day in
            if day > right {
                right = day
            }
            if day < left {
                left = day
            }
        }
        func check(_ date: Int) -> Bool {
            var cnt = 0
            var curSum = 0
            bloomDay.forEach { day in
                if day <= date {
                    curSum += 1
                } else {
                    cnt += curSum / k
                    curSum = 0
                }
            }
            cnt += curSum / k
            return cnt >= m
        }
        var checked = Set<Int>()
        var ans = Int.max
        while left < right {
            let mid = left + (right - left) >> 1
            checked.insert(mid)
            if check(mid) {
                ans = min(ans, mid)
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return checked.contains(left) ? ans : min(ans, check(left) ? left : Int.max)
    }
}

