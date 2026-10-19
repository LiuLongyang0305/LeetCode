// https://leetcode.cn/problems/maximum-subtree-of-the-same-color/
    class Solution {
        private typealias Pair = (color:Int, cnt: Int)
        func maximumSubtreeSize(_ edges: [[Int]], _ colors: [Int]) -> Int {
            let tree = buildTree(edges, colors.count)
            var ans = 1



            func dfs(_ cur: Int, _ pa: Int) -> Pair {
                var curColor = colors[cur], y = 1
                for next in tree[cur] {
                    guard next != pa else {continue}
                    let (childColor,childCnt) = dfs(next, cur)
                    if childColor != curColor {
                        curColor = 0
                        y = 0
                    } else {
                        y += childCnt
                    }
                }
                if curColor != 0 {
                    ans = max(ans,y)
                }
                return (curColor,y)
            }

            let _ = dfs(0, -1)


            return ans
        }

        private func buildTree(_ edges:[[Int]], _ n: Int) -> [[Int]] {
            var tree = [[Int]](repeating: [], count: n)
            for e in edges {
                let (f,s) = (e[0],e[1])
                tree[f].append(s)
                tree[s].append(f)
            }
            return tree
        }
    }
