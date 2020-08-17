// https://leetcode.com/problems/magnetic-force-between-two-balls/
class Solution {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        let sortedPosition = position.sorted()
        let N = position.count
        func check(_ dis: Int) -> Bool {
            var cnt = 1
            var curPosition = sortedPosition[0]
            for i in 1..<N {
                if sortedPosition[i] - curPosition >= dis {
                    cnt += 1
                    curPosition = sortedPosition[i]
                }
            }
            return cnt >= m
        }
        var l = 0
        var r = sortedPosition.last! - sortedPosition[0]
        var ans = Int.min
        while l <= r {
            // print("l = \(l)  r = \(r)")
            let mid = l + (r - l) >> 1
            if check(mid) {
                ans = max(ans, mid)
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return ans
    }
}