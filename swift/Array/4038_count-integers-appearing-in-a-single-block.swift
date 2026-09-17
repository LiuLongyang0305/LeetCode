    //https://leetcode.cn/problems/count-integers-appearing-in-a-single-block/
    class Solution {
        private typealias Range = (left:Int, right:Int)
        func countSpecialIntegers(_ nums: [Int]) -> Int {
            var map = [Int:[Range]]()
            for (i,v) in nums.enumerated() {
                if var lastPair = map[v]?.last {
                    if i == lastPair.right + 1 {
                        lastPair.right += 1
                        map[v]?.removeLast()
                        map[v]?.append(lastPair)
                    } else {
                        map[v]?.append((i,i))
                    }
                } else {
                    map[v] = [(i,i)]
                }
            }
            var cnt = 0
            for (_,pairs) in map {
                if pairs.count == 1 {
                    cnt += 1
                }
            }
            return cnt
        }
    }
