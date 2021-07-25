//https://leetcode.com/problems/describe-the-painting/
class Solution {
    func splitPainting(_ segments: [[Int]]) -> [[Int]] {
        guard segments.count > 1 else {
            return segments
        }
        var arrow = Array<Int>(repeating: 0, count: 100005)
        var isSplitPoint = Array<Bool>(repeating: false, count: 100005)
        for segement in segments {
            arrow[segement[0]] += segement[2]
            arrow[segement[1]] -= segement[2]
            isSplitPoint[segement[0]] = true
            isSplitPoint[segement[1]] = true

        }
        for i in 1...100000 {
            arrow[i] += arrow[i - 1]
        }
        var ans = [[Int]]()
        var last = 0
        for i in 1...100000 {
            if arrow[i] != arrow[last] || isSplitPoint[i]{
                if arrow[last] != 0 {
                    ans.append([last,i,arrow[last]])
                }
                last = i
            }
        }
        return ans
    }
}