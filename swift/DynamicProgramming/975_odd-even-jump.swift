// https://leetcode.com/problems/odd-even-jump/
class Solution {
    
    func oddEvenJumps(_ arr: [Int]) -> Int {
        
        let N = arr.count
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: 2), count: N)
        dp[N - 1][0] = true
        dp[N - 1][1] = true
        var ans = 1
        
        var map = [arr[N - 1]: N - 1]
        var sortedNumbers = [Int]()
        sortedNumbers.append(arr[N - 1])
        
        
        var idx = N - 2
        while idx >= 0 {
            //奇数跳跃
            let idx1 = searchFirstElementWhoGreaterThanOrEqualTo(arr[idx], in: sortedNumbers)
            if -1 != idx1 {
               dp[idx][1] = dp[map[sortedNumbers[idx1]]!][0]
            }
            //偶数跳跃
            let idx2 = searchLastElementWhoLessThanOrEqualTo(arr[idx], in: sortedNumbers)
            if idx2 != -1 {
                dp[idx][0] = dp[map[sortedNumbers[idx2]]!][1]
            }
            if dp[idx][1] {
                ans += 1
            }
            //加入数组
            map[arr[idx]] = idx
            if -1 == idx1 {
                sortedNumbers.append(arr[idx])
            } else if -1 == idx2 {
                sortedNumbers.insert(arr[idx], at: 0)
            } else {
                if sortedNumbers[idx1] != arr[idx] {
                    sortedNumbers.insert(arr[idx], at: idx1)
                }
            }
            idx -= 1
        }
        
        return ans
    }
    
    func searchFirstElementWhoGreaterThanOrEqualTo(_ target: Int, in arr: [Int]) -> Int {
        //必须保证存在
        guard arr.last! >= target else {
            return -1
        }
        guard arr.last! > target else {
            return arr.count - 1
        }
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if(arr[mid] >= target) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    func searchLastElementWhoLessThanOrEqualTo(_ target: Int, in arr: [Int]) -> Int {
        //保证存在
        guard arr.first! <= target else {
            return -1
        }
        guard arr.first! < target else {
            return 0
        }
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right + 1) >> 1
            if(arr[mid] > target) {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}

