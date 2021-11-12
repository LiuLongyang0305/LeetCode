// https://leetcode.com/problems/create-maximum-number/
class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        let N = nums1.count
        let M = nums2.count
        guard M + N > k else {
            return merge(nums2, nums1)
        }
        guard M != 0 else {
            return maxArray(nums1, k)
        }
        guard N != 0 else {
            return maxArray(nums2, k)
        }
        var ans = [Int]()
        var i = max(0, k - M)
        while i <= k && i <= N {
            let t = merge(maxArray(nums1, i), maxArray(nums2, k - i))
            if compare(t, ans) {
                ans = t
            }
            i += 1
        }
        return ans
    }
    
    //arr1 是否大于arr2
    private  func compare(_ arr1: [Int], _ arr2: [Int]) -> Bool{
        let M = min(arr1.count, arr2.count)
        var idx = 0
        while idx < M && arr2[idx] == arr1[idx] {
            idx += 1
        }
        if idx < M {
            return arr1[idx] > arr2[idx]
        }
        return arr1.count > arr2.count
    }
    private func maxArray(_ arr: [Int], _ need: Int) -> [Int] {
        let N = arr.count
        var ans = [Int](repeating: -1, count: need)
        var i = 0
        var j = 0
        while i < N {
            while N - i + j > need && j > 0 && ans[j - 1] < arr[i] {
                j -= 1
            }
            if j < need {
                ans[j] = arr[i]
                j += 1
            }
            i += 1
        }
        return ans
    }
    
    private func  merge(_ arr1: [Int], _ arr2: [Int] ) -> [Int] {
        var arr1Copy = arr1
        var arr2Copy = arr2
        var ans = [Int]()
        while !arr1Copy.isEmpty && !arr2Copy.isEmpty {
            if compare(arr1Copy, arr2Copy) {
                ans.append(arr1Copy[0])
                arr1Copy.removeFirst()
            } else {
                ans.append(arr2Copy[0])
                arr2Copy.removeFirst()
            }
        }
        while !arr1Copy.isEmpty {
            ans.append(arr1Copy[0])
            arr1Copy.removeFirst()
        }
        while !arr2Copy.isEmpty {
            ans.append(arr2Copy[0])
            arr2Copy.removeFirst()
        }
        return ans
    }
}
