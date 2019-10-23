//https://leetcode.com/problems/find-k-closest-elements/
class Solution2 {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        while left < right {
            let mid = left + (right - left) >> 1
            if x - arr[mid] > arr[mid + k] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return [Int](arr[left..<(left + k)])
    }
}
class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        guard k > 0 else {
            return []
        }
        guard x >= arr[0] else {
            return [Int](arr[0..<k])
        }
        guard x < arr.last! else {
            return [Int](arr[(arr.count - k)...])
        }
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if arr[mid] > x {
                right = mid
            } else if arr[mid] < x{
                left = mid + 1
            } else {
                right = left
            }
        }
        var ans = [Int]()
        var i = left - 1
        var j = left
        while ans.count < k {
            let next = j == arr.count ? Int.max : arr[j] - x
            while i >= 0 && x - arr[i]  <= next && ans.count < k{
                ans.insert(arr[i], at: 0)
                i -= 1
            }
            if  ans.count < k && j < arr.count {
                ans.append(arr[j])
                j += 1
            }
        }
        return ans
    }
}