//https://leetcode.com/problems/multiply-strings/

let charToInt : Dictionary<Character,Int> = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]
let intToChar : Array<Character> = ["0","1","2","3","4","5","6","7","8","9"]

class Solution {
    private var  currentSum = [Int]()
    func multiply(_ num1: String, _ num2: String) -> String {
        if num2 == "0" || num1 == "0" {
            return "0"
        }
        let first = (num1.count >= num2.count ? num1 : num2).map { (ch) -> Int in
            charToInt[ch]!
        }
        let second = (num1.count < num2.count ? num1 : num2).map { (ch) -> Int in
            charToInt[ch]!
        }
        let size = second.count
        var i = size - 1
        while i >= 0 {
            var carry = 0
            var ans = Array<Int>(repeating: 0, count: size - 1 - i)
            let multiplier = second[i]
            if  multiplier != 0 {
                var j = first.count - 1
                while j >= 0 {
                    let temp = multiplier * first[j] + carry
                    ans.insert(temp % 10, at: 0)
                    carry = temp / 10
                    j -= 1
                }
                if  carry != 0 {
                    ans.insert(carry, at: 0)
                }
                if  currentSum.isEmpty {
                    currentSum = ans
                } else {
                    add(num: ans)
                }
            }
            i -= 1
        }
        
        var ans = ""
        for ele in currentSum {
            ans.append(intToChar[ele])
        }
        return ans
    }
    
    private func add(num: [Int]) {
        let  size  = num.count
        let addZeroNumber = size - currentSum.count
        if addZeroNumber > 0 {
            currentSum.insert(contentsOf: Array<Int>(repeating: 0, count: addZeroNumber), at: 0)
        }
        var carry = 0
        var i = size - 1
        while i >= 0 {
            let temp = currentSum[i] + num[i] + carry
            currentSum[i] = temp % 10
            carry = temp / 10
            i -= 1
        }
        if carry != 0 {
            currentSum.insert(carry, at: 0)
        }
    }
}
