//https://leetcode.com/problems/k-diff-pairs-in-an-array/
class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        guard k >= 0 else {
            return 0
        }
        var set = Set<Int>()
        var existed = Set<Int>()
        var count = 0
        for ele in nums {
            if k != 0 {
                if !set.contains(ele) {
                    if set.contains(ele + k) {
                        count +=  1
                    }
                    if set.contains(ele - k) {
                        count += 1
                    }
                    set.insert(ele)
                }
            } else {
                if set.contains(ele) {
                    count += 1
                    set.remove(ele)
                    existed.insert(ele)
                }
                if !existed.contains(ele) {
                    set.insert(ele)
                }
            }
        }
        return count
    }
}