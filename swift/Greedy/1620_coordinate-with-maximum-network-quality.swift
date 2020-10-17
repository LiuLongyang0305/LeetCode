// https://leetcode.com/problems/coordinate-with-maximum-network-quality/
class Solution {
    func bestCoordinate(_ towers: [[Int]], _ radius: Int) -> [Int] {
        var quality = [[Int]:Int]()
        let radiusPower2 = radius * radius
        for tower in towers {
            let tx = tower[0]
            let ty = tower[1]
            for r in (tx - radius)...(tx + radius) {
                for c in (ty - radius)...(ty + radius) {
                    let disPower2 = (tx - r) * (tx - r) + (ty - c) * (ty - c)
                    if disPower2 <= radiusPower2 {
                        let key = [r,c]
                        let curQ = Int(floor(Double(tower[2]) / (1.0 + sqrt(Double(disPower2)))))
                        if let q = quality[key] {
                            quality[key] = q + curQ
                        } else {
                            quality[key] = curQ
                        }
                        
                    }
                }
            }
        }
        let maxQ = quality.values.max()!
        var ans = [Int]()
        for (key,q) in quality {
            guard q == maxQ else {
                continue
            }
            guard !ans.isEmpty else {
                ans = key
                continue
            }
            guard !(ans[0] < key[0] || (ans[0] == key[0] && ans[1] < key[1])) else {
                continue
            }
            ans = key
        }
        return ans
    }
}

