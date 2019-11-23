//https://leetcode.com/problems/largest-divisible-subset/
class Solution {
    typealias Info = (parent: Int,length: Int)
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        let numbers = nums.sorted()
        var map = [Int:Info]()
        map[numbers[0]] = (numbers[0],1)
        var maxLengthEndNum = numbers[0]
        var maxLength = 1
        for i in 1..<numbers.count {
            var info: Info = (0,0)
            for (key,val) in map {
                if numbers[i] % key == 0 {
                    if val.length > info.length {
                        info = (key,val.length)
                    }
                }
            }
            if info.length != 0 {
                map[numbers[i]] = (info.parent,info.length + 1)
                if maxLength < info.length + 1 {
                    maxLength = info.length + 1
                    maxLengthEndNum = numbers[i]
                }
            } else {
                map[numbers[i]] = (numbers[i],1)
            }
        }
        var ans = [Int]()
        ans.insert(maxLengthEndNum, at: 0)
        while let info = map[ans.first!], info.parent != ans.first! {
            ans.insert(info.parent, at: 0)
        }
        return ans
    }
}