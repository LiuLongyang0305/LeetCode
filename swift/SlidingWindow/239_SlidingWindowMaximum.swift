//https://leetcode.com/problems/sliding-window-maximum/
class Solution {
    private var nums = [Int]()
    private var deque = Array<Int>()
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        guard k != 1 else {
            return nums
        }
        guard k != nums.count else {
            return [nums.max()!]
        }
        self.nums = nums
        let n = nums.count
        var maxEleIndex  = 0
        
        for i in 0..<k {
            cleanDeque(i, k)
            deque.append(i)
            if nums[i] > nums[maxEleIndex] {
                maxEleIndex = i
            }
        }
        var ans = Array<Int>(repeating: 0, count: n - k + 1)
        ans[0] = nums[maxEleIndex]
        for i in k..<n {
            cleanDeque(i, k)
            deque.append(i)
            ans[i - k + 1] = nums[deque.first!]
        }
        return ans
    }
    private func cleanDeque(_ start: Int, _ end: Int) {
        if !deque.isEmpty && deque.first! == start - end {
            deque.removeFirst()
        }
        while !deque.isEmpty && nums[start] > nums[deque.last!]{
            deque.removeLast()
        }
    }
}
