// https://leetcode.com/problems/count-largest-group/
class Solution {
    func countLargestGroup(_ n: Int) -> Int {
        var ans = 0
        var counter = [Int:Int]()
        for i in 1...n {
            var temp = i
            var sum = 0
            while temp > 0 {
                sum += temp % 10
                temp /= 10
            }
            counter.updateValue((counter[sum] ?? 0) + 1, forKey: sum)
        }
        let maxGroupSize = counter.values.max()!
        for (_,val) in counter {
            if val == maxGroupSize {
                ans += 1
            }
        }
        return ans
    }
}

