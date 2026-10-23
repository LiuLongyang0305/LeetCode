    // https://leetcode.cn/problems/minimum-time-to-visit-all-houses/
    class Solution {
        func minTotalTime(_ forward: [Int], _ backward: [Int], _ queries: [Int]) -> Int {
            let M = forward.count
            var f = [Int](repeating: 0, count: M * 2)
            var b = [Int](repeating: 0, count: M * 2)
            for i in 1..<(2 * M) {
                f[i] = f[i - 1] + forward[(i - 1) % M]
                b[i] = b[i - 1] + backward[(i - 1) % M]
            }
            var res = 0
            var pre = 0
            for cur in queries {
                res += min(f[cur > pre ? cur : (cur + M)] - f[pre],b[(cur < pre ? pre : (pre + M)) + 1] - b[cur + 1])
                pre = cur
            }
            return res
        }
    }
