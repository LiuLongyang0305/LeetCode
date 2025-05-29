//https://leetcode.cn/problems/find-beautiful-indices-in-the-given-array-i/
class Solution {
    private let INF = 1_000_000_007
    func beautifulIndices(_ s: String, _ a: String, _ b: String, _ k: Int) -> [Int] {
        var indicesOfB = [Int]()
        var i = 0
        for sub in s.windows(ofCount: b.count) {
            if sub == b {
                indicesOfB.append(i)
            }
            i += 1
        }

        guard a != b else {return indicesOfB}
        var ans = [Int]()
        indicesOfB = [-INF] + indicesOfB + [INF]
        i = 0
        for sub in s.windows(ofCount: a.count) {
            if sub == a {
                let (p,a) = binarySearchFirstLargerThan(in: indicesOfB, i)
                if abs(i - a) <= k || abs(i - p) <= k {
                    ans.append(i)
                }

            }
            i += 1
        }
        return ans
    }
    private func binarySearchFirstLargerThan(in arr: [Int], _  target: Int) -> (pre:Int, after: Int) {
        var l = 0
        var r = arr.count - 1

        while l < r {
            let mid = (l + r) >> 1
            if arr[mid] >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }

        return (arr[l - 1], arr[l])
    }

}
