// https://leetcode.com/problems/coordinate-with-maximum-network-quality/
class Solution {
    func bestCoordinate(_ _towers: [[Int]], _ radius: Int) -> [Int] {
        let towers = _towers.filter { $0[2] > 0}
        guard !towers.isEmpty else {return [0,0]}
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
            if q == maxQ {
                if ans.isEmpty {
                    ans = key
                } else {
                    if ans[0] == key[0] {
                        if ans[1] > key[1] {
                            ans = key
                        }
                    } else if ans[0] > key[0] {
                        ans = key
                    }
                }
            }
        }
        return ans
    }
}
