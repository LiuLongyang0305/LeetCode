// https://leetcode-cn.com/problems/best-line-lcci/
class Solution {
    func bestLine(_ points: [[Int]]) -> [Int] {
        guard points.count > 2 else {
            return [0,1]
        }
        var ans = (0,-1,-1)
        let N = points.count
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                var cnt = 2
                var k = j + 1
                while k < N {
                    let v1 = (points[i][0] - points[j][0],points[i][1] - points[j][1])
                    let v2 = (points[i][0] - points[k][0],points[i][1] - points[k][1])
                    if v1.0 * v2.1 == v2.0 * v1.1 {
                        cnt += 1
                    }
                    k += 1
                }
                // print("i = \(i) j = \(j) cnt = \(cnt)")
                if ans.0 < cnt {
                    ans = (cnt,i,j)
                }
            }
        }
        return [ans.1,ans.2]
    }
}
