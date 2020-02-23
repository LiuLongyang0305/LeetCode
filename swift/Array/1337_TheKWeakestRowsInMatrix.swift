// https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/ 
class Solution {
    typealias Info = (r:Int,sum: Int)
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let N = mat[0].count
        let M = mat.count
        var infos = [Info]()
        for r in 0..<M {
            var count = 0
            var index = 0
            while index < N && mat[r][index] == 1 {
                count += 1
                index += 1
            }
            infos.append((r,count))
        }
        let sortedInfos = infos.sorted { (row1, row2) -> Bool in
            if row1.sum == row2.sum {
                return row1.r < row2.r
            }
            return row1.sum < row2.sum
        }
        return sortedInfos[0..<k].map { $0.r}
    }
 }

