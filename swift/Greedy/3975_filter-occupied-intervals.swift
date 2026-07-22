    // https://leetcode.cn/problems/filter-occupied-intervals/
class Solution {
    private typealias Pair = (from:Int, to: Int)
    func filterOccupiedIntervals(_ occupiedIntervals: [[Int]], _ freeStart: Int, _ freeEnd: Int) -> [[Int]] {
        let sortedOccupiedIntervals:[Pair] = occupiedIntervals.map {($0[0],$0[1])}.sorted { p1, p2 in
            p1.from < p2.from
        }

        var pairs = [sortedOccupiedIntervals[0]]
        for p in sortedOccupiedIntervals.dropFirst() {
            var last = pairs.last!
            if p.to <= last.to {continue}
            if p.from - last.to > 1 {
                pairs.append(p)
            } else {
                last.to = p.to
                pairs[pairs.count - 1] = last
            }
        }

        var sb = [[Int]]()

        for p in pairs {
            //p在空闲内
            if p.from >= freeStart && p.to <= freeEnd {continue}
            //p在空闲外
            if p.to < freeStart || p.from > freeEnd {
                sb.append([p.from,p.to])
                continue
            }
            //空闲在P内:恰好等于P，或者重合一个端点，或者两个端点都不重合
            if freeStart >= p.from && freeEnd <= p.to {
                if p.from == freeStart && p.to == freeEnd {continue}
                if freeStart == p.from{
                    sb.append([freeEnd + 1,p.to])
                } else if freeEnd == p.to {
                    sb.append([p.from,freeStart - 1])
                    continue
                } else {
                    sb.append([p.from,freeStart - 1])
                    sb.append([freeEnd + 1, p.to])
                }
                continue
            }
            //P和空闲存在交集
            if p.to >= freeStart && p.to <= freeEnd {
                sb.append([p.from,freeStart - 1])
            } else {
                sb.append([freeEnd + 1,p.to])
            }

        }
        return sb
    }
}
