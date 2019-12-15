 class Solution {
    typealias RowInfo = (minEleIndex:Int,secondMinEleIndex:Int)
    typealias ElementInfo = (index:Int,val:Int)
    func minFallingPathSum(_ arr: [[Int]]) -> Int {
        let row = arr.count
        let col = arr[0].count
        var infos = [RowInfo]()
        for r in 0..<row {
            var temp = [ElementInfo]()
            for c in 0..<col {
                temp.append((c,arr[r][c]))
            }
            temp.sort {$0.val < $1.val}
            infos.append((temp[0].index,temp[1].index))
        }
        func caculate(sum: Int, colIndex: Int, rowIndex: Int) -> Int {
            var tempSum = sum
            let nextRow = rowIndex + 1
            var nextCol = -1
            if colIndex == infos[nextRow].minEleIndex {
                tempSum += arr[nextRow][infos[nextRow].secondMinEleIndex]
                nextCol = infos[nextRow].secondMinEleIndex
            } else {
                tempSum += arr[nextRow][infos[nextRow].minEleIndex ]
                nextCol = infos[nextRow].minEleIndex
            }
            guard nextRow < row - 1 else {
                return tempSum
            }
            return caculate(sum: tempSum, colIndex: nextCol , rowIndex: nextRow)
        }
        var ans = Int.max
        for c in 0..<col {
            ans = min(ans, caculate(sum: arr[0][c], colIndex: c, rowIndex: 0))
        }
        return ans
    }
 }

