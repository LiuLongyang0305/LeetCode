  //https://leetcode.cn/problems/maximum-path-intersection-sum-in-a-grid/
    class Solution {
        func maxScore(_ grid: [[Int]]) -> Int {
            let M = grid.count
            let N = grid[0].count
            var sb = Int.min
            for row in grid.dropFirst().dropLast() {
                for num in row.dropFirst().dropLast() {
                    sb = max(sb,num)
                }
            }
            for row in grid {
                sb = max(sb,getMaxSumOfSubarrayLengthMoreThanOrEqualTwo(row))
            }
            for row in reverse(grid) {
                sb = max(sb,getMaxSumOfSubarrayLengthMoreThanOrEqualTwo(row))
            }
            return sb
        }


        private func getMaxSumOfSubarrayLengthMoreThanOrEqualTwo(_ arr: [Int]) -> Int {
            let N = arr.count
            var preffix = [0]
            for num in arr {
                preffix.append(preffix.last! + num)
            }
            var sb = preffix[2]
            var heap = Heap<Int>()
		heap.insert(0)
            for i in 2..<N {
                //考虑当前位置
                heap.insert(preffix[i - 1])
                sb = max(sb,preffix[i + 1] - heap.min!)
            }
            return sb
        }


        private func reverse(_ grid: [[Int]]) -> [[Int]] {
            var sb = [[Int]]()
            for c in 0..<grid[0].count {
                var row = [Int]()
                for r in 0..<grid.count {
                    row.append(grid[r][c])
                }
                sb.append(row)
            }
            return sb
        }
    }
