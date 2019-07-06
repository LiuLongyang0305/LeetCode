//https://leetcode.com/problems/split-array-into-consecutive-subsequences/
typealias Counter = Dictionary<Int,Int>
extension Counter {
    mutating func getCounter(key: Int) -> Int {
        return self[key] == nil ? 0 : self[key]!
    }
    mutating func add(key: Int,value: Int)  {
        if self[key] == nil {
            self[key] = value
        } else {
            self[key] = getCounter(key: key) + value
        }
    }
}

class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        if nums.count < 3 {
            return false
        }
        var count = Counter()
        var tail = Counter()
        
        for ele in nums {
            count.add(key: ele, value: 1)
        }
        
        for ele in nums {
            if count.getCounter(key: ele) == 0 {
                continue
            } else if tail.getCounter(key: ele) > 0 {
                tail.add(key: ele, value: -1)
                tail.add(key: ele + 1, value: 1)
            } else if count.getCounter(key: ele + 1) > 0 && count.getCounter(key: ele + 2) > 0 {
                count.add(key: ele + 1, value: -1)
                count.add(key: ele + 2, value: -1)
                tail.add(key: ele + 3, value: 1)
            } else {
                return false
            }
            count.add(key: ele, value: -1)

        }
        return true
    }
}