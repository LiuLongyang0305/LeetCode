//https://leetcode.com/problems/last-stone-weight-ii/
class Solution {  
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        guard stones.count > 2 else {
            return stones.count == 1 ? stones[0] : abs(stones[0] - stones[1])
        }
        let total = stones.reduce(0) {$0 + $1}
        let halfSum = total >> 1
        var last = Array<Bool>(repeating: false, count: halfSum + 1)
        last[0] = true
        if stones[0] <= halfSum {
            last[stones[0]] = true
        }
        for index in 1..<stones.count {
            var temp = last
            for j in 0...halfSum {
                if last[j]  &&  j + stones[index] <= halfSum {
                    temp[j + stones[index] ] = true
                }
            }
            last = temp
        }
        let index = last.lastIndex(of: true)!
        return total - (index << 1)
    }
 }