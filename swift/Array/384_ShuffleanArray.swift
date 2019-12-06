//https://leetcode.com/problems/shuffle-an-array/
class Solution {
    private var array: [Int]
    private var original: [Int]
    
    init(_ nums: [Int]) {
        original = nums
        array = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        array = original
        return original
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        for i in 0..<array.count {
            array.swapAt(i, Int.random(in: ClosedRange<Int>(uncheckedBounds: (lower: i, upper: array.count - 1))))
        }
        return array
    }
 }
/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */