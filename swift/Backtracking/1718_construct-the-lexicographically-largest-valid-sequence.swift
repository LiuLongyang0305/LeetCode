// https://leetcode.com/problems/construct-the-lexicographically-largest-valid-sequence/
class Solution {
    func constructDistancedSequence(_ n: Int) -> [Int] {
        
        let N = 2 * n - 1
        var ans = Array<Int>(repeating: 0, count: N)
        var  visited = Array<Bool>(repeating: false, count: n + 1)
        
        func backtracking(_ curIndex: Int) -> Bool {
            guard curIndex != N else {
                return true
            }
            if ans[curIndex] != 0 {
                return backtracking(curIndex + 1)
            }
            
            for i in stride(from: n, to: 0, by: -1) {
                guard !visited[i] else {
                    continue
                }
                if i == 1 {
                    ans[curIndex] = 1
                    visited[i] = true
                    guard !backtracking(curIndex + 1) else {
                        return true
                    }
                    visited[i] = false
                    ans[curIndex] = 0
                } else {
                   guard curIndex + i < N && ans[curIndex + i] == 0 else {
                        continue
                   }
                    ans[curIndex] = i
                    ans[curIndex + i] = i
                    visited[i] = true
                    guard !backtracking(curIndex + 1) else {
                        return true
                    }
                    ans[curIndex] = 0
                    ans[curIndex + i] = 0
                    visited[i] = false
                }
                
            }
            return false
        }
        backtracking(0)
        return ans
    }
}