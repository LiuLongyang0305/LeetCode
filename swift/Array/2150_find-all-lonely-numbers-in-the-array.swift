// https://leetcode.com/problems/find-all-lonely-numbers-in-the-array/
class Solution {
    func findLonely(_ nums: [Int]) -> [Int] {
        var counter = [Int:Int]()
        for num in nums {
            counter[num, default: 0] += 1
        }
        var ans = [Int]()
        for (num,cnt) in counter {
            guard cnt == 1  && nil == counter[num - 1] && nil == counter[num + 1]  else {continue}
            ans.append(num)
        }
        return ans
    }
}