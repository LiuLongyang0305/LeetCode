// https://leetcode.cn/problems/lexicographically-smallest-string-after-adjacent-removals/
    class Solution {
        private let diffSet: Set<Int> = [1,-1,25,-25]
        func lexicographicallySmallestString(_ s: String) -> String {
            let chars = [Character](s)
            let nums = chars.map { ch in
                Int(ch.asciiValue!)
            }

            func isConnected(_ i: Int, _ j: Int) -> Bool{
                return diffSet.contains(nums[i] - nums[j])
            }
            let N = chars.count
            var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: N), count: N)
            func  canBeEmpty(_ i: Int, _ j: Int) -> Bool {
                guard i <= j else {return true}
                if let sb = memo[i][j] {return sb}
                if isConnected(i, j) && canBeEmpty(i + 1, j - 1) {
                    memo[i][j] = true
                    return true
                }
                for k in i..<j {
                    if canBeEmpty(i, k) && canBeEmpty(k + 1, j) {
                        memo[i][j] = true
                        return true
                    }
                }
                memo[i][j] = false
                return false
            }


            var memoAns = [Int:String]()

            func dfs(_ i: Int) -> String {
                guard i < N else {return ""}
                if let sb = memoAns[i] {
                    return sb
                }
                var sb = "\(chars[i])" + dfs( i + 1)
                if i + 1 < N {
                    for j in (i + 1)..<N {
                        if canBeEmpty(i, j) {
                            let t = dfs(j + 1)
                            if t < sb {
                                sb = t
                            }
                        }
                    }
                }
                memoAns[i] = sb
                return sb
            }
            return dfs(0)
        }
    }
