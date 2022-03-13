 // https://leetcode.com/problems/find-all-k-distant-indices-in-an-array/
class Solution {
    func findKDistantIndices(_ nums: [Int], _ key: Int, _ k: Int) -> [Int] {
        let N = nums.count
        var keyIndices = [Int]()
        
        for idx in 0..<N {
            if nums[idx] == key {
                keyIndices.append(idx)
            }
        }
        guard !keyIndices.isEmpty else {return []}
        var ans = [Int]()
        for idx in 0..<N {
            guard nums[idx] != key else {
                ans.append(idx)
                continue
            }
            if let idx2 = keyIndices.last(where: {$0 < idx}) {
                if idx -  idx2 <= k {
                    ans.append(idx)
                    continue
                }
            }
            if let idx3 = keyIndices.first(where: {$0 > idx}) {
                if idx3 - idx <= k {
                    ans.append(idx)
                }
            }
        }
        return ans
    }
}