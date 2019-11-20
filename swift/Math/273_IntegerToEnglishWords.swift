//https://leetcode.com/problems/integer-to-english-words/
class Solution {
    private let numToStr: [Int:String] = [0: "Zero",1:"One", 2: "Two",3:"Three",4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9: "Nine",10:"Ten",20:"Twenty",30:"Thirty",40:"Forty",50:"Fifty",60:"Sixty",70:"Seventy",80:"Eighty",90:"Ninety",11:"Eleven",12:"Twelve",13:"Thirteen",14:"Fourteen",15:"Fifteen",16:"Sixteen",17:"Seventeen",18:"Eighteen",19:"Nineteen"]
    private let unit = ["","Thousand","Million","Billion"]
    func numberToWords(_ num: Int) -> String {
        if let  str = numToStr[num] {
            return  str
        }
        var number = num
        var i = 0
        var ans = ""
        while number > 0 {
            let tempNum = number % 1000
            if tempNum != 0 {
                let str = numberLessThanOneThousandToWords(number % 1000, unit[i])
                if  ans.isEmpty {
                    ans.insert(contentsOf: str, at: ans.startIndex)
                } else {
                    ans.insert(" ", at: ans.startIndex)
                    ans.insert(contentsOf: str, at: ans.startIndex)
                }
            }
            i += 1
            number /= 1000
        }
        return ans
    }
     private func numberLessThanOneThousandToWords(_ num:  Int, _ unit: String) -> String {
        if let str = numToStr[num] {
            if unit.isEmpty {
                return str
            }
            return str + " " + unit
        }
        var str = ""
        var number = num
        if number >= 100  {
            let t = number / 100
            str += numToStr[t]!  + " " + "Hundred"
            number %= 100
        }
        guard number > 0 else {
            if unit.isEmpty {
                return str
            }
            return str + " " + unit
        }
        if let temp = numToStr[number] {
            str += " " + temp
            if unit.isEmpty {
                return str
            }
            return str + " " +  unit
        }
        if !str.isEmpty  {
            str += " "
        }
        str += numToStr[number / 10 * 10]!
        number %= 10
        guard number > 0 else {
            if unit.isEmpty {
                return str
            }
            return str + " " + unit
        }
        str += " " + numToStr[number]!
        if unit.isEmpty {
            return str
        }
        return str + " " + unit
    }
}
Solution().numberToWords(1000000)
