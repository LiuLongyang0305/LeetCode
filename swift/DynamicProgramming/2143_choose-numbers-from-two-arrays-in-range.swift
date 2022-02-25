//https://leetcode.com/problems/choose-numbers-from-two-arrays-in-range/
class Solution {
    private let MOD = 1_000_000_007
    func countSubranges(_ nums1: [Int], _ nums2: [Int]) -> Int {
        
        var  ans = 0
        var map = [Int:Int]()
        let N = nums1.count
        
        for idx in 0..<N {
            var newMap = [Int:Int]()
            newMap[nums1[idx], default: 0] += 1
            newMap[-nums2[idx], default: 0] += 1
            
            
            for (dif,cnt) in map {
                newMap[dif + nums1[idx], default: 0] += cnt
                newMap[dif + nums1[idx], default: 0] %= MOD
                newMap[dif - nums2[idx], default: 0] += cnt
                newMap[dif - nums2[idx], default: 0] %= MOD
            }
            
            ans += newMap[0] ?? 0
            ans %= MOD
            map = newMap
        }
        return ans
    }
}