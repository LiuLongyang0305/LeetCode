//https://leetcode.com/problems/largest-rectangle-in-histogram/
class Solution1 {
    func largestRectangleArea(_ _heights: [Int]) -> Int {
        guard !_heights.isEmpty else {return 0}
        let heights = [0] + _heights + [0]
        let M = heights.count
        var ans = 0
        var stack = [0]
        var i = 1
        while i < M {
            while heights[i] < heights[stack.last!] {
                let idx = stack.removeLast()
                ans = max(ans,heights[idx] * (i - stack.last! - 1) )
            }
            stack.append(i)
            i += 1
        }
        return ans
    }
}

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var indexStack = [Int]()
        let len = heights.count
        
        var maxArea = 0
        for i in 0..<len  {
            while !indexStack.isEmpty && heights[indexStack.last!] >= heights[i] {
                let currentHeight = heights[indexStack.removeLast()]
                let currentWidth = i - (indexStack.last ?? -1) - 1
                maxArea = max(maxArea, currentHeight * currentWidth)
            }
            indexStack.append(i)
        }
        
        while !indexStack.isEmpty  {
            let currentHeight = heights[indexStack.removeLast()]
            let currentWidth = len - (indexStack.last ?? -1) - 1
            maxArea = max(maxArea, currentWidth * currentHeight)
        }
        
        return maxArea
        
    }
}
