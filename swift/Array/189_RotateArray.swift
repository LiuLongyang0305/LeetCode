//https://leetcode.com/problems/rotate-array/
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 1 else {
            return
        }
        let size = nums.count
        let necessaryStep = k % size
        guard necessaryStep != 0 else {
            return
        }
        let reverseNecessaryStep = size - necessaryStep
        if necessaryStep < reverseNecessaryStep {
            let toMoveElements = nums[(size - necessaryStep)...]
            nums.removeLast(necessaryStep)
            nums.insert(contentsOf: toMoveElements, at: 0)
            return
        }
        let toMoveElements = nums[0..<reverseNecessaryStep]
        nums.removeFirst(reverseNecessaryStep)
        nums.append(contentsOf: toMoveElements)
    }
}