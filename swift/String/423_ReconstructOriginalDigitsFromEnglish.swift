//https://leetcode.com/problems/reconstruct-original-digits-from-english/
class Solution {
    func originalDigits(_ s: String) -> String {
        var str = ""
        var counter :[Character:Int] = [:]
        let numbersStr = ["zero","six","seven","four","five","three","two","one","eight","nine"]
        let uniqueChar: [Character] = ["z","x","s","u","v","r","w","o","g","i"]
        let number = [0,6,7,4,5,3,2,1,8,9]
        var countNumbers = Array<Int>(repeating: 0, count: 10)
        for ch in s {
            if let temp = counter[ch] {
                counter[ch] = temp + 1
            } else {
                counter[ch] = 1
            }
        }
        for i in 0..<10 {
            if let count = counter[uniqueChar[i]] {
                countNumbers[number[i]] = count
                let word  = numbersStr[i]
                for ele in word {
                    if let  temp = counter[ele] {
                        counter[ele] = temp - count
                    }
                }
            }
        }
        for i in 0..<10 {
            if countNumbers[i] > 0 {
                for _ in 0..<countNumbers[i] {
                    str += "\(i)"
                }
            }
        }
        return str
    }
}