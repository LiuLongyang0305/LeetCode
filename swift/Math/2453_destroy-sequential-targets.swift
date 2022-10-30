// https://leetcode.com/problems/destroy-sequential-targets/
class Solution {
    private typealias Pair = (start:Int,cnt:Int)
    func destroyTargets(_ nums: [Int], _ space: Int) -> Int {

        var counter = [Int:Pair]()
        nums.forEach { v in
            let remain = v % space
            if var pair = counter[remain] {
                pair.cnt += 1
                if v < pair.start {
                    pair.start = v
                }
                counter[remain] = pair
            } else {
                counter[remain] = (v,1)
            }
        }
        var ans = Int.max
        var curMaxCnt = 0
        for (_,pair) in counter {
            let (s,c) = pair
            if c > curMaxCnt {
                ans = s
                curMaxCnt = c
            } else if c == curMaxCnt {
                if s < ans {
                    ans = s
                }
            }
        }
        return ans
    }
}