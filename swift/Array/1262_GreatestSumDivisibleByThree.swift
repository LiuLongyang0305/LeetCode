//https://leetcode.com/problems/greatest-sum-divisible-by-three/
class Solution {
    typealias SmallestTwo = (first:Int?, second: Int?)
    func maxSumDivThree(_ nums: [Int]) -> Int {
        var ans = 0
        var remainderOne: SmallestTwo = (nil,nil)
        var remainderTwo: SmallestTwo = (nil,nil)
        for num in nums {
            ans += num
            if num % 3 == 1 {
                if remainderOne.first ==  nil  {
                    remainderOne.first = num
                } else if remainderOne.second == nil {
                    if num >= remainderOne.first! {
                        remainderOne.second = num
                    } else {
                        remainderOne.second = remainderOne.first
                        remainderOne.first = num
                    }
                    
                } else {
                    if num >= remainderOne.second! {
                        continue
                    }
                    if num <= remainderOne.first! {
                        remainderOne.second = remainderOne.first
                        remainderOne.first = num
                        continue
                    }
                    remainderOne.second = num
                }
            } else if num % 3 == 2 {
                if remainderTwo.first ==  nil  {
                    remainderTwo.first = num
                } else if remainderTwo.second == nil {
                    if num >= remainderTwo.first! {
                        remainderTwo.second = num
                    } else {
                        remainderTwo.second = remainderTwo.first
                        remainderTwo.first = num
                    }
                    
                } else {
                    if num >= remainderTwo.second! {
                        continue
                    }
                    if num <= remainderTwo.first! {
                        remainderTwo.second = remainderTwo.first
                        remainderTwo.first = num
                        continue
                    }
                    remainderTwo.second = num
                }
            }
        }
//        print("remaindOne = \(remainderOne)   remaindTwo = \(remainderTwo)")
        guard ans % 3 != 0 else {
            return ans
        }
        guard ans % 3 != 1 else {
            var potentionAns = Array<Int>(repeating: Int.min, count: 2)
            if let num = remainderOne.first {
                potentionAns[0] = ans - num
            }
            if let num1 = remainderTwo.first, let num2 = remainderTwo.second {
                potentionAns[1] = ans - num1 - num2
            }
            return potentionAns[0] < potentionAns[1] ? potentionAns[1] : potentionAns[0]
        }
        var potentionAns = Array<Int>(repeating: Int.min, count: 2)
        if let num = remainderTwo.first {
            potentionAns[0] = ans - num
        }
        if let num1 = remainderOne.first, let num2 = remainderOne.second {
            potentionAns[1] = ans - num1 - num2
        }
        return potentionAns[0] < potentionAns[1] ? potentionAns[1] : potentionAns[0]
    }
}