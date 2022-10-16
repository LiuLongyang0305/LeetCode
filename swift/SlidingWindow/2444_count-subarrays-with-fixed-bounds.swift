// https://leetcode.com/problems/count-subarrays-with-fixed-bounds/
class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        let segments = nums.split { $0 > maxK || $0 < minK}
        var ans = 0
        for s in segments {
            guard s.contains(minK) && s.contains(maxK) else {continue}
            let seg = [Int](s)
            let N = seg.count
            var latestMinKIdx = -1
            var latestMaxKIdx = -1

            for i in 0..<N {
                if seg[i] == minK {
                    latestMinKIdx = i
                }
                if seg[i] == maxK {
                    latestMaxKIdx = i
                }
                let necessaryIdx = min(latestMinKIdx, latestMaxKIdx)
                if necessaryIdx != -1 {
                    ans += necessaryIdx + 1
                }
            }
        }
        return ans
    }
}