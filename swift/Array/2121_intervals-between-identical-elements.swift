//https://leetcode.com/problems/intervals-between-identical-elements/
class Solution {
    func getDistances(_ arr: [Int]) -> [Int] {
        var valToIndices = [Int:[Int]]()
        let N = arr.count
        for i in 0..<N {
            valToIndices[arr[i], default: []].append(i)
        }
        var ans = [Int](repeating: 0, count: N)
        
        for (_,indices) in valToIndices {
            if indices.count == 1 {
                ans[indices[0]] = 0
            } else if indices.count == 2 {
                let d = indices[1] - indices[0]
                ans[indices[0]] = d
                ans[indices[1]] = d
            } else {
                let M = indices.count
                var leftDis = [Int](repeating: 0, count: M)
                for idx in 1..<M {
                    leftDis[idx] = leftDis[idx - 1] + idx * (indices[idx] - indices[idx - 1])
                }
                var rightDis = [Int](repeating: 0, count: M)
                
                for idx in stride(from: M - 2, through: 0, by: -1) {
                    rightDis[idx] = rightDis[idx + 1] + (M - 1 - idx) * (indices[idx + 1] - indices[idx])
                }
                for idx in 0..<M {
                    ans[indices[idx]] = leftDis[idx] + rightDis[idx]
                }
            }
        }
        return ans
    }
}