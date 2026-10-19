 // https://leetcode.cn/problems/smallest-subarray-to-sort-in-every-sliding-window/
     class Solution {
         func minSubarraySort(_ nums: [Int], _ k: Int) -> [Int] {
             guard k >= 2 else {
                 return [Int](repeating: 0, count: nums.count)
             }
             guard k > 2 else {
                 var ans = [Int](repeating: 0, count: nums.count - 1)
                 for i in 1..<nums.count {
                     ans[i - 1] = nums[i] >= nums[i - 1] ? 0 : 2
                 }
                 return ans
             }
             var ans = [Int]()
             var sortedWindow = (0..<k).sorted { i,j in
                 if nums[i] == nums[j] {
                     return i < j
                 } else {
                     return nums[i] < nums[j]
                 }
             }
             var target = [Int](0..<k)
             func cal(_ window: [Int]) -> Int {
                 var i = 0
                 while i < k && target[i] == window[i] {
                     i += 1
                 }
                 if i == k {
                     return 0
                 }
                 var j = k - 1
                 while j >= 0 && target[j] == window[j] {
                     j -= 1
                 }
                 return j - i + 1
             }

             func remove(_ idx: Int) {
                 for i in 0..<k {
                     if sortedWindow[i] == idx {
                         sortedWindow.remove(at: i)
                         return
                     }
                 }
             }


             func add(_ idx: Int) {
                 if let f = sortedWindow.first, nums[idx] < nums[f] {
                     sortedWindow.insert(idx, at: 0)
                     return
                 }
                 if let la = sortedWindow.last, nums[idx] >= nums[la] {
                     sortedWindow.append(idx)
                     return
                 }
                 var l = 0
                 var r = k - 2
                 while l < r {
                     let mid = (l + r) >> 1
                     let midVal = nums[sortedWindow[mid]]
                     if midVal > nums[idx] {
                         r = mid
                     } else {
                         l = mid + 1
                     }
                 }
                 sortedWindow.insert(idx, at: l)
             }

             ans.append(cal(sortedWindow))

             for j in k..<nums.count {
                 //移除j - k的数
                 remove(j - k)
                 //添加j位置的数
                 add(j)
                 target.append(j)
                 target.removeFirst()
                 ans.append(cal(sortedWindow))
             }
             return ans
         }
     }
