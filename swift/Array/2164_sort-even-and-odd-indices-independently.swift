//https://leetcode.com/problems/sort-even-and-odd-indices-independently/
class Solution {
    func sortEvenOdd(_ nums: [Int]) -> [Int] {
        var odds = [Int]()
        var evens = [Int]()
        
        for idx in 0..<nums.count {
            if idx & 1 == 0 {
                evens.append(nums[idx])
            } else {
                odds.append(nums[idx])
            }
        }
        odds.sort{$0 > $1}
        evens.sort()
//        print(odds)
        
        var ans = [Int]()

        let M = odds.count
        var i = 0
        while i < M {
            ans += [evens[i],odds[i]]
            i += 1
        }
        if evens.count > odds.count {
            ans.append(evens.last!)
        }
        return ans
    }
}