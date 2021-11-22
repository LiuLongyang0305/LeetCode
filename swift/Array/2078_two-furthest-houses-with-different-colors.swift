// https://leetcode.com/problems/two-furthest-houses-with-different-colors/
class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        var ans = 0
        var colorToIndex = [Int:Int]()
        let N = colors.count
        for i in 0..<N {
            let color = colors[i]
            for (c,idx) in colorToIndex {
                if c != color {
                    ans = max(ans, i - idx)
                }
            }
            if nil == colorToIndex[color] {
                colorToIndex[color] = i
            }
        }
        return ans
    }
}