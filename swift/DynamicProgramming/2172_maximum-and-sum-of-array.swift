// https://leetcode.com/problems/maximum-and-sum-of-array/
class Solution {
    private var numbers = [Int]()
    private var N = -1
    private var memo = [String:Int]()
    private var M = -1
    func maximumANDSum(_ nums: [Int], _ numSlots: Int) -> Int {
        self.numbers = nums
        self.N = nums.count
        self.memo = [:]
        self.M = numSlots
        return helper(0, [Int](repeating: 0, count: numSlots))
    }
    
    
    private  func helper(_ idx: Int, _ slotState: [Int]) -> Int {
        guard idx < N else {return 0}
        let key = slotState.reduce("") { $0 + "-\($1)"}
        if let c = memo[key] {return c}
        var ans = -1
        for slotNum in 0..<M {
            if slotState[slotNum] < 2 {
                var sCopy = slotState
                sCopy[slotNum] += 1
                ans = max(ans, (numbers[idx] & (slotNum + 1) + helper(idx + 1, sCopy)))
            }
        }
        memo[key] = ans
        return ans
    }
}
