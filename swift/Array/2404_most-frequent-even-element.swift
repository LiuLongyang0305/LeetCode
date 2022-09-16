// https://leetcode.com/problems/most-frequent-even-element/
class Solution {
    func mostFrequentEven(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        for num in nums {
            guard num & 1 == 0 else {continue}
            counter[num,default: 0] += 1
        }
        guard !counter.isEmpty else {return -1}
        var ans = -1
        var cnt = -1
        for (k,c) in counter {
            guard c >= cnt else {continue}
            if c > cnt {
                (ans,cnt) = (k,c)
            } else {
                ans = min(ans, k)
            }
        }
        return ans
    }
}