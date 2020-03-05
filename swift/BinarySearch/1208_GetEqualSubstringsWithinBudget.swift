// https://leetcode.com/problems/get-equal-substrings-within-budget/
class Solution {
    typealias MaxLengthAndCost = (length:Int,cost:Int)
     func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        
        let s2Nums = s.map { Int($0.asciiValue!)}
        let t2Nums = t.map { Int($0.asciiValue!)}
        let N = s.count
        var maxLength = 0

        var prefix = Array<Int>(repeating: 0, count: N + 1)
        for i in 0..<N {
            prefix[i + 1] = prefix[i] + abs(s2Nums[i] - t2Nums[i])
            if prefix[i + 1] == prefix[i] {
                maxLength = 1
            }
        }
        var firstIndex = 1
        

        func search(_ firstindex: Int) -> Int {
            var left = firstIndex
            var right = N
            while left <= right {
                
                let mid = left + ((right - left) >> 1)
                if prefix[mid] - prefix[firstIndex - 1] > maxCost {
                    right = mid - 1
                } else {
                    if mid == N  ||  prefix[mid + 1] - prefix[firstIndex - 1] > maxCost {
                        return mid
                    }
                    left = mid + 1
                }
                
            }
            return -1
        }
        
        while true {
            
            let possibleMaxLength = N - firstIndex + 1
            
            if possibleMaxLength <= maxLength {
                break
            }
            if prefix[firstIndex + maxLength - 1] - prefix[firstIndex - 1] > maxCost {
                firstIndex += 1
                continue
            }
            let index = search(firstIndex)
            maxLength = max(maxLength, index - firstIndex + 1)
            firstIndex += 1
        }
        return maxLength
     }
 }

  class Solution {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        let s2Nums = s.map { Int($0.asciiValue!)}
        let t2Nums = t.map { Int($0.asciiValue!)}
        var ans = 0
        var cost = 0
        let N = s.count
        var left = 0
        var right = 0
        while right < N {
            cost += abs(s2Nums[right] - t2Nums[right])
            while cost > maxCost {
                cost -= abs(s2Nums[left] - t2Nums[left])
                left += 1
            }
            ans = max(ans, right - left + 1)
            right += 1
        }
        return ans
    }
 }