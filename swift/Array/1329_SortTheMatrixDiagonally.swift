// https://leetcode.com/problems/sort-the-matrix-diagonally/
class Solution {
    typealias Indices = (r:Int,c:Int)
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        
        let M = mat.count
        let N = mat[0].count
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: N), count: M)
        
        var dic = [Int:[Int]]()
        var map = [Int:Indices]()
        for r in 0..<M {
            for c in 0..<N {
                if r == 0 || c == 0 {
                    map[c - r] = (r,c)
                }
                if nil == dic[c - r] {
                     dic[c - r] = []
                }
                dic[c - r]?.append(mat[r][c])
            }
        }
        for (key,arr) in dic {
            dic[key] = arr.sorted()
        }
        for (key,sortedArr) in dic {
            var r = map[key]!.r
            var c = map[key]!.c
            for ele in sortedArr {
                ans[r][c] = ele
                r += 1
                c += 1
            }
        }
        return ans
    }
 }