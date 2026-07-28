    // https://leetcode.cn/problems/aggregate-two-time-series/
    class Solution {
        func aggregateTimeSeries(_ series1: [[Int]], _ series2: [[Int]]) -> [[Int]] {

            var sb = [[Int]]()
            let M = series1.count
            var N = series2.count

            var i = 0
            var j = 0

            while i < M && j < N  {
                if series1[i][0] < series2[j][0] {
                    sb.append([series1[i][0],series1[i][1] + (j < N ? series2[j][1] : 0)] )
                    i += 1
                } else if series1[i][0] > series2[j][0] {
                    sb.append([series2[j][0],series2[j][1] + (i < M ? series1[i][1] : 0)])
                    j += 1
                } else {
                    sb.append([series1[i][0],series1[i][1] + series2[j][1]])
                    i += 1
                    j += 1
                }
            }

            while i < M {
                sb.append(series1[i])
                i += 1
            }
            while j < N {
                sb.append(series2[j])
                j += 1
            }
            return sb

        }
    }
