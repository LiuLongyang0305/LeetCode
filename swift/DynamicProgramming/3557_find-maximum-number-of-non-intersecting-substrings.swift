//https://leetcode.com/problems/find-maximum-number-of-non-intersecting-substrings
class Solution {
    func maxSubstrings(_ word: String) -> Int {

        let chars = [Character](word)
        let N = chars.count

        var chToindices = [Character:[Int]]()
        for i in 0..<N {
            chToindices[chars[i],default: [-1]].append(i)
        }
        for (ch,_) in chToindices {
            chToindices[ch]?.append(N + 5)
        }

        var memo = [Int](repeating: -1, count: N )
        func dfs(_ cur: Int) -> Int {
            guard cur < N else {return 0}
            if -1 != memo[cur] {
                return memo[cur]
            }
            var ans = dfs(cur + 1)
            if  let indices = chToindices[chars[cur]] {
                let idx = binarySearchFirstLargerThan(cur + 3, in: indices)
                if idx != indices.count - 1 {
                    ans = max(ans, 1 + dfs(indices[idx] + 1))
                }
            }
            memo[cur] = ans
            return ans
        }


        return dfs(0)
    }


    private func binarySearchFirstLargerThan(_ target: Int, in arr:[Int]) -> Int {
        var l = 0
        var r = arr.count - 1
        while l < r {
            let m = (l + r) >> 1
            if arr[m] >= target {
                r = m
            } else {
                l = m + 1
            }
        }
        return l
    }

}
