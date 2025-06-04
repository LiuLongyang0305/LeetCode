//https://leetcode.com/problems/minimum-cost-for-cutting-cake-i
class Solution {
    func minimumCost(_ m: Int, _ n: Int, _ horizontalCut: [Int], _ verticalCut: [Int]) -> Int {

        func getIndex(_ sr: Int, _ sc:Int, _ er: Int, _ ec: Int) -> Int {
            return (sr * n + sc) *  (m * n) + er * n + ec
        }

        var memo = [Int?](repeating: nil, count: m * m * n * n)
        func dfs(_ sr: Int, _ sc: Int, _ er: Int, _ ec: Int) -> Int {
            guard er - sr > 0 || ec - sc > 0 else {
                return 0
            }
            let key = getIndex(sr, sc, er, ec)
            if let v = memo[key] {
                return v
            }
            var ans = Int.max
            var r = sr
            while r < er {
                ans = min(ans, horizontalCut[r] + dfs(sr, sc, r, ec) + dfs(r + 1, sc, er, ec))
                r += 1
            }
            var c = sc
            while c < ec {
                ans = min(ans,verticalCut[c] + dfs(sr, sc, er, c) + dfs(sr, c + 1, er, ec))
                c += 1
            }
            memo[key] = ans
            return ans
        }


        return dfs(0, 0, m - 1, n - 1)
    }
}
