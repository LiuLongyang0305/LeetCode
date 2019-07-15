//https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/
class Solution {

    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let limit = Int(sqrt(Double(k)))
        let size = matrix.count
        var ans = [Int]()
        for i in 0..<size {
            for j in 0..<size {
                if  !(i >= limit &&  j >= limit){
                    ans.append(matrix[i][j])
                }
            }
        }
        ans.sort()
        return ans[k -  1]
    }
}