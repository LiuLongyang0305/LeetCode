//https://leetcode.com/problems/number-of-unique-flavors-after-sharing-k-candies/
class Solution {
    func shareCandies(_ candies: [Int], _ k: Int) -> Int {
        
        var ans = 0
        var counter = [Int:Int]()
        candies.forEach { counter[$0,default: 0] += 1}
        for i in 0..<candies.count {
            counter[candies[i], default: 0] -= 1
            if (counter[candies[i]] ?? 0) == 0 {
                counter.removeValue(forKey: candies[i])
            }
            if i >= k {
                counter[candies[i - k], default: 0] += 1
            }
            if i >= k - 1 {
                ans = max(ans, counter.count)
            }
        }
        return ans
    }
}