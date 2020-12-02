// https://leetcode-cn.com/problems/best-line-lcci/
class Solution {
    func bestLine(_ points: [[Int]]) -> [Int] {
        var ans = verticalOrHorizonLines(points)
        let N = points.count
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                guard points[i][0] != points[j][0] && points[i][1] != points[j][1] else {
                    continue
                }
                var cnt = 2
                var k = j + 1
                let m = Double((points[j][0] - points[i][0])) / Double((points[j][1] - points[i][1]))
                while k < N {
                    let tempM = Double((points[k][0] - points[i][0])) / Double((points[k][1] - points[i][1]))
                    if fabs(m - tempM) <= 1e-4 {
                        cnt += 1
                    }
                    k += 1
                }
                if cnt > ans.0 {
                    ans = (cnt,i,j)
                } else if cnt == ans.0 {
                    if i < ans.1 {
                        ans = (cnt,i,j)
                    }
                }
            }
        }
        return [ans.1,ans.2]
    }
    
    private func verticalOrHorizonLines(_ points: [[Int]]) -> (Int,Int,Int) {
        var xMap = [Int:[Int]]()
        var yMap = [Int:[Int]]()
        for idx in 0..<points.count {
            let point = points[idx]
            xMap[point[0],default: [] ].append(idx)
            yMap[point[1],default: [] ].append(idx)
        }
        var ans = (-1,-1,-1)
        for (_,indices) in xMap {
            let m = indices.count
            guard m >= 2 else {
                continue
            }
            if m > ans.0 {
                ans = (m,indices[0],indices[1])
            } else if ans.0 == m {
                if indices[0] < ans.1 {
                    ans = (m,indices[0],indices[1])
                }
            }
        }
        for (_,indices) in yMap {
            let m = indices.count
            guard m >= 2 else {
                continue
            }
            if m > ans.0 {
                ans = (m,indices[0],indices[1])
            } else if ans.0 == m {
                if indices[0] < ans.1 {
                    ans = (m,indices[0],indices[1])
                }
            }
        }
        return ans
    }
}