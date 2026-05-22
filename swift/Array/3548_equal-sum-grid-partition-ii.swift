    // https://leetcode.cn/problems/equal-sum-grid-partition-ii/
    class Solution {
        func canPartitionGrid(_ grid: [[Int]]) -> Bool {
            let total = getTotal(for: grid)
            //因为只按照行处理数据，所以需要转置矩阵重新计算原本归属于列的分割
            return checkGrid(for: grid, total) || checkGrid(for: roatate(for: grid), total)
        }

        private func checkByRow(for grid: [[Int]], _ total: Int) -> Bool {
                //处理特殊情况，只有一行或者只有一列
                if grid.count == 1 {
                    return checkWhenJustOneCol(roatate(for: grid), total)
                }
                if grid[0].count == 1 {
                    return checkWhenJustOneCol(grid, total)
                }

            //分割矩阵，前后两个部分，并尝试从前半部分删除元素
            var st = Set<Int>(grid[0])
            st.insert(0)
            var s = grid[0].reduce(0) {$0 + $1}
            for row in grid.dropFirst().dropLast() {

                for num in row {
                    s += num
                    st.insert(num)
                }

                if st.contains(s * 2 - total) {
                    return true
                }

            }

            return false
        }

        private func checkExactRow(for grid: [[Int]], _ rowIndex: Int, _ total: Int) -> Bool {

            let specialPartSum = grid[rowIndex].reduce(0) { $0 + $1}
            let remain = total - specialPartSum
            //不用删除
            guard specialPartSum != total - specialPartSum else {return true}
            //如果删除只能删除单行的第一个元素或者最后一个元素
            let f = grid[rowIndex].first!
            let l = grid[rowIndex].last!
            return (remain == specialPartSum - f) || (remain == specialPartSum - l)

        }

        private func checkWhenJustOneCol(_ grid:[[Int]], _ total: Int) -> Bool {
            let M = grid.count
            var s = 0
            for r in 0..<M {
                s += grid[r][0]
                //不删除或者删除第一个元素或者删除分割线的元素
                if (s == total - s) || (s - grid[0][0] == total - s) || (s - grid[r][0] == total - s) {
                    return true
                }
            }
            return false
        }

        private func checkGrid(for grid: [[Int]], _ total: Int) -> Bool {
                //处理特殊情况：分成的两部分是： 第一行和其他，并且尝试从第一行中删除元素
                //最后一行和其他，并且尝试从最后一行中删除元素
                if checkExactRow(for: grid, 0, total) || checkExactRow(for: grid, grid.count - 1, total) {
                    return true
                }

            //因为算法只是尝试从前半部分删除数据，所以需要把矩阵翻转，并尝试计算
            return checkByRow(for: grid, total) || checkByRow(for: reverse(for: grid), total)
        }


        private func roatate(for grid:[[Int]]) -> [[Int]] {
            let M = grid.count
            let N = grid[0].count
            var sb = [[Int]](repeating: [Int](repeating: -1, count: M), count: N)
            for r in 0..<M {
                for c in 0..<N {
                    sb[c][M - 1 - r] = grid[r][c]
                }
            }
            return sb
        }

        private func reverse(for grid: [[Int]]) -> [[Int]] {
            return grid.reversed()
        }

        private func getTotal(for grid:[[Int]]) -> Int {
            var sb = 0
            for r in grid {
                for num in r {
                    sb += num
                }
            }
            return sb
        }
    }
