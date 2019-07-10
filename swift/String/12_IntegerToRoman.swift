//https://leetcode.com/problems/integer-to-roman/
class Solution {
    let numberToRoman = [1000:"M",900:"CM",500:"D",400:"CD",100:"C",90:"XC",50:"L",40:"XL",10:"X",9:"IX",5:"V",4:"IV",1:"I"]
    let sortedBase = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    func intToRoman(_ num: Int) -> String {
        var ans = ""
        var temp = num
        for base in sortedBase {
            if temp >= base {
                temp %= base
                ans += String(repeating: numberToRoman[base]!, count: temp / base)
            }
        }
        return ans
    }
}