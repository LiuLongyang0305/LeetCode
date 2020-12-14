// https://leetcode.com/problems/maximum-height-by-stacking-cuboids/
class Solution {
    private struct Cuboid {
        var width: Int
        var length: Int
        var height: Int
        static func <(l:Cuboid,r:Cuboid) -> Bool {
            if l.width !=  r.width {
                return l.width < r.width
            }
            if l.length != r.length {
                return l.length < r.length
            }
            return l.height <= r.height
        }
    }
    func maxHeight(_ cuboids: [[Int]]) -> Int {
        let N = cuboids.count
        guard N > 1 else {
            return cuboids[0].max()!
        }
        let sortedCuboids = cuboids.map { createCubiod($0)}.sorted { $0 < $1}
        var dp = sortedCuboids.map {$0.height}
        for idx in 1..<N {
            var ans = sortedCuboids[idx].height
            for j in stride(from: idx - 1, through: 0, by: -1) {
                if sortedCuboids[idx].width >= sortedCuboids[j].width && sortedCuboids[idx].length >= sortedCuboids[j].length && sortedCuboids[idx].height >= sortedCuboids[j].height {
                    ans = max(ans, dp[j] + sortedCuboids[idx].height)
                }
            }
            dp[idx] = ans
        }
        return dp.max()!
    }
    
    private func createCubiod(_ cuboid: [Int]) -> Cuboid {
        let w = cuboid.min()!
        let h = cuboid.max()!
        let l = cuboid.reduce(0) { $0 + $1} - w - h
        return Cuboid(width: w, length: l, height: h)
    }
}

