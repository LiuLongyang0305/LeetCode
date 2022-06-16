//https://leetcode.com/problems/k-diff-pairs-in-an-array/
class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var counter = [Int:Int]()
        nums.forEach { counter[$0,default: 0] += 1 }
        for (num,cnt) in counter {
            if k == 0 {
                if cnt > 1 {
                    ans += 1
                }
            } else {
                if let _ = counter[num + k] {
                    ans += 1
                }
            }
        }
        return ans
    }
}