    //https://leetcode.cn/problems/minimum-initial-strength-to-defeat-all-monsters/
    class Solution {
        func minInitialStrength(_ monsters: [Int], _ boosts: [[Int]]) -> Int {
            let M = monsters.count
            var preffix = [Int](repeating: 0, count: M + 5)
            for boost in boosts {
                let (l,r,b) = (boost[0],boost[1],boost[2])
                preffix[l] += b
                preffix[r + 1] -= b
            }
            for i in 1...M {
                preffix[i] += preffix[i - 1]
            }

            func check(_ strength: Int) -> Bool {
                var curStrength = strength
                for i in 0..<M {
                    guard curStrength + preffix[i] >= monsters[i] else {return false}
                    curStrength = max(0,curStrength - monsters[i])
                }
                return true
            }


            var l = 0
            var r = 1_000_000_000_000_000
            while l < r {
                let mid = (l + r) >> 1
                if check(mid) {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }
    }
