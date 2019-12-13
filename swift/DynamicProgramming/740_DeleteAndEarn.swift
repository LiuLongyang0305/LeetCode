// https://leetcode.com/problems/delete-and-earn/
class Solution {
    typealias State = (val:Int,included:Int,excluded:Int)
    func deleteAndEarn(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var counter = [Int:Int]()
        for num in nums {
            if let c = counter[num] {
                counter.updateValue(c + 1, forKey: num)
            } else {
                counter.updateValue(1, forKey: num)
            }
        }
        
        let sortedKeys = counter.keys.sorted()
        var last: State = (sortedKeys.first!, sortedKeys.first!  * counter[sortedKeys.first!]!, 0)
        guard sortedKeys.count > 1 else {
            return last.included
        }
        for i in 1..<sortedKeys.count {
            
            let currentKey = sortedKeys[i]
            let c = counter[currentKey]!
            var temp = last
            if currentKey - last.val == 1 {
                temp.included = last.excluded + c * currentKey
            } else {
                temp.included = max(last.included + c * currentKey, last.excluded + c * currentKey)
            }
            temp.excluded = max(last.included, last.excluded)
            temp.val = currentKey
            last = temp
        }
        return max(last.included, last.excluded)
    }
 }
 