    // https://leetcode.cn/problems/find-all-numbers-disappeared-in-an-array-ii/
    class Solution {
        private typealias Pair = (left:Int,right:Int)
        func findDisappearedNumbers(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
            var existed = [Bool](repeating: false, count: upper + 1)
            for num in nums {
                if num >= lower && num <= upper {
                    existed[num] = true
                }
            }
            var sb = [Pair]()
            for i in lower...upper {
                if !existed[i] {
                    if var p = sb.last {
                        if p.right == i - 1 {
                            p.right += 1
                            sb[sb.count - 1] = p
                        } else {
                            sb.append((i,i))
                        }
                    } else {
                        sb.append((i,i))
                    }
                }
            }
            return sb.map { p in
                [p.left,p.right]
            }
        }
    }
