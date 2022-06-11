// https://leetcode.com/problems/max-sum-of-rectangle-no-larger-than-k/
class Solution {
    private let INF = 1_000_000_007
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let N = matrix.count
        let M = matrix[0].count
        var preffix = [[Int]](repeating: [Int](repeating: 0, count: M + 1), count: N + 1)
        for i in 1...N {
            for j in 1...M {
                preffix[i][j] = preffix[i - 1][j] + preffix[i][j - 1] + matrix[i - 1][j - 1] - preffix[i - 1][j - 1]
            }
        }
        func get( x1:Int,y1:Int,x2:Int,y2:Int) -> Int {
            return preffix[x2][y2] - preffix[x1 - 1][y2] - preffix[x2][y1 - 1] + preffix[x1 - 1][y1 - 1]
        }



        var ans = -INF
        for c1 in 1...M {
            for c2 in c1...M {
                var sortedPreffix = [-INF,0,INF]
                for r in 1...N {
                    let cur = get(x1: 1, y1: c1, x2: r, y2: c2)
                    let idx = binarySearch(in: sortedPreffix, cur - k)
                    if sortedPreffix[idx] != INF {
                        ans = max(ans, cur - sortedPreffix[idx])
                    }
                    let idx2 = binarySearch(in: sortedPreffix, cur)
                    sortedPreffix.insert(cur, at: idx2)
                }

            }
        }
        return ans
    }


    private func binarySearch(in arr: [Int], _ target: Int) -> Int {


        var left = 0
        var right = arr.count - 1

        while left < right {
            let mid = (left + right) >> 1
            if arr[mid] >= target {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
