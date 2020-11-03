// https://leetcode.com/problems/sort-array-by-increasing-frequency/
class Solution {
    func frequencySort(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        var counter = [Int:Int]()
        for num in nums {
            counter[num, default: 0] += 1
        }
        let sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            
            let (key0, value0) = arg0
            let (key1,value1) = arg1
            if value1 == value0 {
                return key0 > key1
            }
            return value0 < value1
        }
        for (num,cnt) in sortedCounter {
            ans.append(contentsOf: Array<Int>(repeating: num, count: cnt))
        }
        return ans
    }
}