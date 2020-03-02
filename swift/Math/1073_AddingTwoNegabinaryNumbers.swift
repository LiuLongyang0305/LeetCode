// https://leetcode.com/problems/adding-two-negabinary-numbers/
class Solution {
    func addNegabinary(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let reversedArr1 = [Int](arr1.reversed())
        let reversedArr2 = [Int](arr2.reversed())
        var ans  = [Int]()

        var carry = 0
        var i = 0
        
        while i < arr1.count || i < arr2.count || carry != 0 {
            var x = carry
            if i < arr1.count {
                x += reversedArr1[i]
            }
            if i < arr2.count {
                x += reversedArr2[i]
            }
            ans.append((x + 2) % 2)
            carry = (x - ans.last!) / -2
            i += 1
        }
        while !ans.isEmpty && ans.last! == 0{
            ans.removeLast()
        }
        return ans.isEmpty ? [0] : ans.reversed()
    }
 }

