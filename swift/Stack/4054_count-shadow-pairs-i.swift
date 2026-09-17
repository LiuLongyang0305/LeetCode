    // https://leetcode.cn/problems/count-shadow-pairs-i/
    class Solution {
        typealias Pair = (val:Int,cnt:Int)
        func shadowPairs(_ nums: [Int]) -> Int {
            var st:[Pair] = [(0,0)]
            var size = 0
            var ans = 0
            for x in nums {
                while let last = st.last, last.val > x {
                    size -= (st.popLast()?.cnt ?? 0)
                }
                ans += size
                if st.last!.val == x {
                    ans -= st.last!.cnt
                    st[st.count - 1].cnt += 1
                } else {
                    st.append((x,1))
                }
                size += 1

            }

            return ans
        }
    }
