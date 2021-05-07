// https://leetcode.com/problems/minimum-distance-to-the-target-element/
class Solution {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        let N  = nums.count
        
        var delta = 0
        while true {
            let left = start - delta
            let right = start + delta
            guard left >= 0 || right < N else {
                break
            }
            if left >= 0 {
                if nums[left] == target {
                    return delta
                }
            }
            if right < N {
                if nums[right] == target {
                    return delta
                }
            }
            delta += 1
        }
        return -1
    }
}

class Solution1 {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        var ans = Int.max
        for idx in 0..<nums.count {
            if nums[idx] == target {
                ans = min(ans, abs(start - idx))
            }
        }
        return ans
    }
}


