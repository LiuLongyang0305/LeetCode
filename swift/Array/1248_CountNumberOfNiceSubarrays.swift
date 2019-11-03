//https://leetcode.com/contest/weekly-contest-161/problems/count-number-of-nice-subarrays/
class Solution {
    typealias Indices = (start:Int,end:Int)
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var ans =  0
        var prev = [Int:Indices]()
        prev[0] = (-1,-1)
        var totalOdds = 0
        for i in 0..<nums.count  {
            if nums[i] % 2 == 1 {
                totalOdds += 1
            }
            if nil == prev[totalOdds] {
                prev[totalOdds] = (i,i)
            } else {
                prev[totalOdds]?.end = i
            }
        }
        var length = k
        while nil != prev[length] {
            if let (start2,end2) = prev[length] {
                if let (start1,end1) = prev[length - k] {
                    ans += (end2 - start2 + 1) * (end1 - start1 + 1)
                }
            }
            length += 1
        }
        return ans
    }
}