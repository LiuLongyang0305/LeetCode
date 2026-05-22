 //https://leetcode.cn/problems/count-subarrays-with-majority-element-ii/
    class Solution {
        func countMajoritySubarrays(_ nums: [Int], _ target: Int) -> Int {
            var preffix = [0]
            var cur = 0
            var sb = 0
            for num in nums {
                cur += (num == target ? 1 : -1)
                if cur > preffix.last! {
                    sb += preffix.count
                    preffix.append(cur)
                } else if cur <= preffix.first! {
                    preffix.insert(cur, at: 0)
                } else {

                    var l = 0
                    var r = preffix.count - 1

                    while l < r {
                        let mid = (l + r + 1) >> 1
                        if preffix[mid] >= cur {
                            r = mid - 1
                        } else {
                            l = mid
                        }
                    }
                    sb += l + 1
                    preffix.insert(cur, at: l + 1)
                }

            }
            return sb
        }
    }
