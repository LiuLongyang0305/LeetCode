//https://leetcode.com/problems/degree-of-an-array/
class Solution {
    private typealias Info = (cnt:Int,l:Int,r:Int)
    func findShortestSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var map = [Int:Info]()
        let N = nums.count
        for idx in 0..<N {
            let num = nums[idx]
            guard var info = map[num] else {
                map[num] = (1,idx,idx)
                continue
            }
            info.cnt += 1
            info.r = idx
            map[num] = info
        }
        var cnt = 0
        for (_,info) in map {
            if info.cnt > cnt {
                cnt = info.cnt
            }
        }
        var ans = Int.max
        for (_,info) in map {
            guard info.cnt == cnt else {
                continue
            }
            ans = min(ans, info.r - info.l + 1)
        }
        return ans
    }
}
