//https://leetcode.com/problems/longest-arithmetic-sequence/
 class Solution1 {
    func longestArithSeqLength(_ A: [Int]) -> Int {
        var valueToIndex = [Int:[Int]]()
        var ans = 0
        for index in 0..<A.count {
            if  nil == valueToIndex[A[index]] {
                valueToIndex[A[index]] = []
            }
            valueToIndex[A[index]]?.append(index)
            if  let c = valueToIndex[A[index]]?.count, c > ans {
                ans = c
            }
        }
        var visited = Set<[Int]>()
        func dfs(_ lastNumber: Int, _ delta: Int,_ length: Int,_ lastIndex: Int) {
            let target = lastNumber + delta
            guard let indices = valueToIndex[target], let nextIndex = indices.first(where: {$0 > lastIndex}) else {
                ans =  max(ans, length)
                return
            }
            
            visited.insert([lastNumber,target])
            dfs(target, delta, length + 1, nextIndex)
        }
        
        for i in 0..<(A.count - 1) {
            for j in (i + 1)..<A.count {
                if A[i] != A[j] && !visited.contains([A[i],A[j]]) {
                    visited.insert([A[i],A[j]])
                    dfs(A[j], A[j] - A[i], 2, j)
                }
            }
        }
        return ans
    }
 }
 class Solution {
    func longestArithSeqLength(_ A: [Int]) -> Int {
        var ans = 2
        let N = A.count
        var dp = Array<[Int:Int]>(repeating: [Int:Int](), count: N)
        for i in 1..<N {
            var temp = [Int:Int]()
            for j in 0..<i {
                let d = A[i] - A[j]
                let length = (dp[j][d] ?? 1) + 1
                temp.updateValue(length, forKey: d)
                ans = max(ans, length)
            }
            dp[i] = temp
        }
        return ans
    }
 }
 let  A = [83,20,17,43,52,78,68,45]
 Solution().longestArithSeqLength(A)
