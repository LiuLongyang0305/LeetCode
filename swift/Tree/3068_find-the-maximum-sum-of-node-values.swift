// https://leetcode.com/problems/find-the-maximum-sum-of-node-values/
class Solution {
    func maximumValueSum(_ nums: [Int], _ k: Int, _ edges: [[Int]]) -> Int {
        let N = nums.count
        var g = Array<Array<Int>>(repeating: [], count: N)
        for edge in edges {
            let (x,y) = (edge[0],edge[1])
            g[x].append(y)
            g[y].append(x)
        }

        //奇数和偶数次
        func dfs(_ x: Int, _ fa: Int) -> (odd:Int,even: Int) {
            var  f0 = 0
            var f1 = Int.min
            for y in g[x] {
                if y != fa {
                    var (r0,r1) = dfs(y, x)
                    let t = max(f1 + r0,f0 + r1)
                    f0 = max(f0 + r0, f1 + r1)
                    f1 = t
                }
            }
            return (max(f0 + nums[x],f1 + (nums[x] ^ k)),max(f1 + nums[x], f0 + (nums[x] ^ k)))
        }


        return dfs(0, -1).odd
    }
}
