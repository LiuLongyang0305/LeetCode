//https://leetcode.com/problems/divide-array-in-sets-of-k-consecutive-numbers/
class Solution {
    func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count >= k && nums.count % k == 0 else {
            return false
        }
        guard k != 1 else {
            return true
        }
        
        guard k != nums.count else {
            let minEle = nums.min()!
            var ans = 0
            for i in 0..<k {
                ans = ans ^ (minEle + k) ^ nums[i]
            }
            return ans == 0
        }
        var counter = [Int:Int]()
        for num in nums {
            if let c = counter[num]  {
                counter.updateValue(c + 1, forKey: num)
            } else {
                counter.updateValue(1, forKey: num)
            }
        }
        let sortedKeys = counter.keys.sorted()
        for key in sortedKeys {
            if let c = counter[key] {
                for num in key..<(key + k) {
                    guard let c1 = counter[num], c1 >= c else {
                        return false
                    }
                    if c1 == c  {
                        counter.removeValue(forKey: num)
                    } else {
                        counter.updateValue(c1 - c, forKey: num)
                    }
                }
            }
        }
        return counter.isEmpty
    }
 }