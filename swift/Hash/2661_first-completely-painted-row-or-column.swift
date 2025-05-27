//https://leetcode.com/problems/first-completely-painted-row-or-column/
class Solution {
    private typealias Position = (x:Int,y:Int)
    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        let M = mat.count
        let N = mat[0].count
        var rowColordCnt = [Int](repeating: 0, count: M)
        var colColoredCnt = [Int](repeating: 0, count: N)
        var map = [Int:Position]()
        for i in 0..<M {
            for j in 0..<N {
                map[mat[i][j]] = (i,j)
            }
        }

        for idx in 0..<(M * N) {

            let (x,y) = map[arr[idx]]!
            rowColordCnt[x] += 1
            colColoredCnt[y] += 1
            if rowColordCnt[x] == N  || colColoredCnt[y] == M {
                return idx
            }

        }

        return -1
    }
}
