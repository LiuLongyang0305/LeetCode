// https://leetcode.cn/problems/alternating-groups-i
class Solution {
    func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
        var ans = 0
        let n = colors.count
        var cnt = 0
        for i in 0..<(2 * n) {
            if colors[i % n] == colors[(i + 1) % n] {
                cnt = 0
            }
            cnt += 1
            ans += (i >= n && cnt >= k) ? 1 : 0
        }
        return ans
    }
}
