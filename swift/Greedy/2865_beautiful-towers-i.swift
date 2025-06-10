//https://leetcode.com/problems/beautiful-towers-i/
class Solution {
    func maximumSumOfHeights(_ heights: [Int]) -> Int {


        let N = heights.count
        func cal(_ topIdx: Int) -> Int {
            var ans = heights[topIdx]
            var last = heights[topIdx]
            var i = topIdx - 1
            while i >= 0 {
                let t = heights[i] >= last ? last : heights[i]
                ans += t
                last = t
                i -= 1
            }
             last = heights[topIdx]
            i = topIdx + 1
            while i < N {
                let t = heights[i] >= last ? last : heights[i]
                ans += t
                last = t
                i += 1
            }
            return ans
        }


        var sb = 0
        for i in 0..<N {
            sb = max(sb,cal(i))
        }

        return sb
    }
}
