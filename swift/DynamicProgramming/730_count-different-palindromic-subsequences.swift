// https://leetcode.com/problems/count-different-palindromic-subsequences/
class Solution {
    private let MOD = 1000000007
    func countPalindromicSubsequences(_ s: String) -> Int {
        let exsitedChars = [Character]("abcd")
        let chars = [Character](s)
        var map = [Character:[Int]]()

        let N = s.count

        for i in 0..<N {
            map[chars[i],default: [-1]].append(i)
        }
        for ch in exsitedChars {
            map[ch]?.append(Int.max)
        }

        var memo = [[Int]](repeating: [Int](repeating: -1, count: N), count: N)
        func dfs(_ left: Int, _ right: Int) -> Int {
            guard left < right else {
                return left > right ? 0 : 1
            }
            guard -1 == memo[left][right] else {return memo[left][right]}
            var ans = 0
            for ch in exsitedChars {
                guard let indices = map[ch] else {continue}
                let l = binarySearchFirstLargerOrEqualToTarget(in: indices, left)
                let r = binarySearchlastLessOrEqualToTarget(in: indices, right)
                guard l <= r else {continue}
                if l == r {
                    ans += 1
                } else {
                    ans += dfs(l + 1, r - 1) + 2
                }
                ans %= MOD
            }
            memo[left][right] = ans
            return ans
        }

        return dfs(0, s.count - 1)
    }

    private func binarySearchFirstLargerOrEqualToTarget(in arr: [Int], _ target:Int) -> Int{
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return arr[left]
    }

    private func binarySearchlastLessOrEqualToTarget(in arr: [Int], _ target:Int) -> Int{
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right + 1) >> 1
            if arr[mid] <= target {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return arr[left]
    }
}