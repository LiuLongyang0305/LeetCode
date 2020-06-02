// https://leetcode.com/problems/maximum-area-of-a-piece-of-cake-after-horizontal-and-vertical-cuts/
class Solution {
    private let MOD = 1_000_000_007
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        var maxHeight = Int.min
        var maxWidth = Int.min
        
        let sortedHorizonCuts = horizontalCuts.sorted()
        let sortedVerticalCuts = verticalCuts.sorted()
        
        if sortedHorizonCuts.count > 1 {
            for i in 1..<sortedHorizonCuts.count {
                maxHeight = max(maxHeight, sortedHorizonCuts[i] - sortedHorizonCuts[i - 1])
            }
        }
        maxHeight =  max(maxHeight, sortedHorizonCuts[0], h - sortedHorizonCuts.last!)
        if sortedVerticalCuts.count > 1 {
            for i in 1..<sortedVerticalCuts.count {
                maxWidth = max(maxWidth, sortedVerticalCuts[i] - sortedVerticalCuts[i - 1])
            }
        }
        maxWidth = max(maxWidth, sortedVerticalCuts[0],w - sortedVerticalCuts.last!)
        return ( maxWidth * maxHeight) % MOD
    }
}