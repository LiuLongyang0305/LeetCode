// https://leetcode.com/problems/maximal-rectangle/
class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty && !matrix[0].isEmpty else {return 0}
        let N = matrix.count
        let M = matrix[0].count
        var heights = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
        for i in 0..<N {
            for j in 0..<M {
                if matrix[i][j] == "1" {
                    if i > 0 {
                        heights[i][j] = heights[i - 1][j] + 1
                    } else {
                        heights[i][j] = 1
                    }
                }
            }
        }
        return heights.reduce(0) {max($0, largestRectangleArea($1) )}
    }
    private  func largestRectangleArea(_ heights: [Int]) -> Int {
        
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