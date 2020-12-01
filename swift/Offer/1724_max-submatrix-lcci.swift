// https://leetcode-cn.com/problems/max-submatrix-lcci/
class Solution {
    private typealias Pair = (low:Int,high:Int)
    private typealias Info = (maxSum: Int, pair:Pair)
    func getMaxMatrix(_ matrix: [[Int]]) -> [Int] {
        let (M,N) = (matrix.count, matrix[0].count)
        guard M > 1 else {
            let info: Info = getMaxSubarraySum(matrix[0])
            return [0,info.pair.low ,0,info.pair.high]
        }
        guard N > 1 else {
            let arr = (0..<M).map { matrix[$0][0]}
            let info: Info = getMaxSubarraySum(arr)
            return [info.pair.low,0,info.pair.high,0]
        }
        var ans = Array<Int>(repeating: 0, count: 4)
        var curMaxSum = Int.min
        for r0 in 0..<M {
            var arr = [Int]()
            var r1 = r0
            while r1 < M {
                if r0 == r1 {
                    arr = matrix[r0]
                } else {
                    for c in 0..<N {
                        arr[c] += matrix[r1][c]
                    }
                }
                let info = getMaxSubarraySum(arr)
                if info.maxSum > curMaxSum  {
                    curMaxSum = info.maxSum
                    ans = [r0,info.pair.low,r1,info.pair.high]
                }
                r1 += 1
            }
        }
        return ans
    }
    private func getMaxSubarraySum(_ arr: [Int]) -> Info {
        var last = arr[0]
        var curCols: Pair = (0,0)
        
        var target = last
        var targetCols: Pair = (0,0)
        
        for i in 1..<arr.count {
            if last > 0 {
                last = last + arr[i]
                curCols.high = i
            } else {
                last = arr[i]
                curCols = (i,i)
            }
            if target < last {
                target = last
                targetCols = curCols
            }
        }
        return (target, targetCols)
    }
}
