// https://leetcode.com/problems/minimum-number-of-lines-to-cover-points/
extension Int {
    var bitCnt: Int {
        var cnt = 0
        var a = self
        while a > 0 {
            a &= (a - 1)
            cnt += 1
        }
        return cnt
    }
}
class Solution {
    private struct Point: Hashable {
        var x: Int
        var y: Int
    }
    
    
    private struct Line: Hashable {
        
        private var start: Point
        init (start:Point,  end: Point) {
            self.start = start
            self.dx = end.x - start.x
            self.dy = end.y - start.y
        }
        private var dx: Int
        private var dy: Int
        public func contains(_ point: Point) -> Bool {
            return dx * (point.y - start.y) == dy * (point.x - start.x)
        }
    }
    func minimumLines(_ ps: [[Int]]) -> Int {
        
        guard ps.count > 2 else {return 1}
        let points = ps.map { Point(x: $0[0], y: $0[1])}
        let N = points.count
        var memo = [Int:Int]()
        let targetMask = (1 << N) - 1
        
        func  helper(_ mask: Int)  -> Int {
            guard mask != targetMask else {return 0}
            guard N - mask.bitCnt > 2 else {return 1}
            if let v = memo[mask] {return v}
            var ans = Int.max
            
            for startIdx in 0..<(N - 1) {
                guard mask & (1 << startIdx) == 0 else {continue}
                for endIdx in (startIdx + 1)..<N {
                    guard mask & (1 << endIdx) == 0 else {continue}
                    let line = Line(start: points[startIdx], end: points[endIdx])
                    var curMask = 0
                    for idx in 0..<N {
                        if line.contains(points[idx]) {
                            curMask |= (1 << idx)
                        }
                    }
                    ans = min(ans, 1 + helper(mask | curMask))
                }
            }
            memo[mask] = ans
            return ans
        }
        return helper(0)
    }
}