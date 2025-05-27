
// https://leetcode.cn/problems/continuous-subarrays/
class  Solution {
    func continuousSubarrays(_ nums: [Int]) -> Int {
        var ans = 0
        var left = 0
        var counter = [Int:Int]()
        for (right,val ) in nums.enumerated() {
            counter[val,default: 0] += 1
            while !counter.isEmpty  && counter.keys.max()! - counter.keys.min()! > 2 {
                let y = nums[left]
                counter[y,default: 0] -= 1
                if let c = counter[y], c == 0 {
                    counter.removeValue(forKey: y)
                }
                left += 1
            }
            ans += right - left + 1
        }
        return ans
    }
}
