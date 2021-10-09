// https://leetcode.com/problems/number-of-pairs-of-strings-with-concatenation-equal-to-target/
class Solution {
    func numOfPairs(_ nums: [String], _ target: String) -> Int {
        var ans = 0
        var counter = [String:Int]()
        nums.forEach { counter[$0, default: 0] += 1}
        var left = ""
        var right = target
        for ch in target {
            
            left.append(ch)
            right.removeFirst()
            ans += (counter[left] ?? 0) * (counter[right] ?? 0)
            if left == right {
                ans -= (counter[left] ?? 0)
            }
        }
        return ans
    }
}