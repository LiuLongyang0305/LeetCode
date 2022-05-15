// https://leetcode.com/problems/rectangle-area-ii/
class Solution {
    private let MOD = 1_000_000_007
    private typealias Pair = (left:Int,right:Int)
    func rectangleArea(_ recs: [[Int]]) -> Int {

        var xs = Set<Int>()
        for rec in recs {
            xs.insert(rec[0])
            xs.insert(rec[2])
        }
        let sortedXs = xs.sorted()

        var ans = 0
        for i in 1..<sortedXs.count {
            ans += caculate(recs,sortedXs[i - 1],sortedXs[i])
        }

        return ans % MOD

    }


    private func caculate(_ recs:[[Int]], _ left: Int, _ right: Int) -> Int {

        var pairs = [Pair]()
        for rec in recs {
            if rec[0] <= left && rec[2] >= right {
                pairs.append((rec[1],rec[3]))
            }
        }

        pairs.sort { p1, p2 in
            p1.left < p2.left
        }

        var length = 0
        var start = -1
        var end = -1

        for pair in pairs {
            if pair.left >= end {
                length += end - start
                start = pair.left
                end = pair.right
            } else if pair.right > end {
                end = pair.right
            }
        }
        length += end - start
        return (right - left) * length % MOD
    }
}
