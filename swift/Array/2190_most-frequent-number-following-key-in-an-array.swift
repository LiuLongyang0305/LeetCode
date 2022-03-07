//https://leetcode.com/problems/most-frequent-number-following-key-in-an-array/
class Solution {
    func mostFrequent(_ nums: [Int], _ key: Int) -> Int {
        var counter = [Int:Int]()
        let N = nums.count
        var i = 0
        while i < N {
            if nums[i] == key {
                let j = i + 1
                if j < N {
                    counter[nums[j], default: 0] += 1
                }
            }
            i += 1
        }
        var ans = -1
        var times = -1
        
        for (v,c) in counter {
            if c > times {
                ans = v
                times = c
            }
        }
        return ans
    }
}