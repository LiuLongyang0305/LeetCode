// https://leetcode.com/problems/maximum-trailing-zeros-in-a-cornered-path/
class Solution {
    private typealias Info = (twosCnt:Int,fivesCnt: Int)
    private var infos = [Info]()

    init() {
        self.infos = (0...1000).map({ caculateInfo(of: $0)})
    }

    func maxTrailingZeros(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count

        guard M != 1 else {
            var m = 0
            var n = 0
            for num in grid[0] {
                m += infos[num].twosCnt
                n += infos[num].fivesCnt
            }
            return min(m, n)
        }

        guard N != 1 else {

            var m = 0
            var n = 0

            for r in 0..<M {
                m += infos[grid[r][0]].twosCnt
                n += infos[grid[r][0]].fivesCnt
            }
            return min(m, n)
        }
        var upPreffix = [[Info]]()
        upPreffix.append([Info](repeating: (0,0), count: N))
        var downPreffix = [[Info]]()
        downPreffix.append([Info](repeating: (0,0), count: N))


        for i in 0..<M {
            var newRow1 = upPreffix.last!
            var newRow2 = downPreffix[0]

            for j in 0..<N {
                newRow1[j].twosCnt += infos[grid[i][j]].twosCnt
                newRow1[j].fivesCnt += infos[grid[i][j]].fivesCnt

                newRow2[j].twosCnt += infos[grid[M - 1 - i][j]].twosCnt
                newRow2[j].fivesCnt += infos[grid[M - 1 - i][j]].fivesCnt
            }
            upPreffix.append(newRow1)
            downPreffix.insert(newRow2, at: 0)
        }

            //        print(upPreffix)
        var leftPreffix = [[Info]]()
        var rightPreffix = [[Info]]()
        for row in grid {
            var leftlast: Info = (0,0)
            var rightlast: Info = (0,0)
            var newRow1 = [leftlast]
            var newRow2 = [rightlast]
            for i in 0..<N {
                leftlast.twosCnt += infos[row[i]].twosCnt
                leftlast.fivesCnt += infos[row[i]].fivesCnt
                newRow1.append(leftlast)
                rightlast.twosCnt += infos[row[N - 1 - i]].twosCnt
                rightlast.fivesCnt += infos[row[N - 1 - i]].fivesCnt
                newRow2.insert(rightlast, at: 0)
            }

            leftPreffix.append(newRow1)
            rightPreffix.append(newRow2)
        }
        var ans = 0
        for i in 0..<M {
            for j in 0..<N {


                let u2 = upPreffix[i + 1][j].twosCnt
                let u5 = upPreffix[i + 1][j].fivesCnt

                let d2 = downPreffix[i][j].twosCnt
                let d5 = downPreffix[i][j].fivesCnt

                let l2 = leftPreffix[i][j].twosCnt
                let l5 = leftPreffix[i][j].fivesCnt

                let r2 = rightPreffix[i][j + 1].twosCnt
                let r5 = rightPreffix[i][j + 1].fivesCnt

                ans = max(ans, min(u2 + l2, u5 + l5),min(u2 + r2, u5 + r5),min(d2 + l2, d5 + l5),min(d2 + r2,d5 + r5))

            }
        }
            // print(ans)
        return ans
    }
    private func caculateInfo(of value:Int) -> Info {
        var m = 0
        var n = 0
        var v = value
        while v > 0 && v % 5 == 0 {
            m += 1
            v /= 5
        }
        while v > 0 && v % 2 == 0 {
            n += 1
            v /= 2
        }
        return (n,m)
    }
}