// https://leetcode.com/problems/binary-subarrays-with-sum/ 
class Solution {
    func numSubarraysWithSum(_ A: [Int], _ S: Int) -> Int {
        var ans = 0
        var sum = 0
        var counter = [Int:Int]()
        counter[0] = 1
        for a in A {
            sum += a
            if let c = counter[sum - S] {
                ans += c
            }
            counter.updateValue((counter[sum] ?? 0) + 1, forKey: sum)
        }
        return ans
    }
 }
 

