 //https://leetcode.com/problems/convert-a-number-to-hexadecimal/
 class Solution {
    private let map: [Int:Character] = [1:"1",2:"2",10:"a",11:"b",12:"c",13:"d",14:"e",15:"f",3:"3",4:"4",5:"5",6:"6",7:"7",8:"8",9:"9"]
    private let map2: [Character:Int] = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"a":10,"b":11,"c":12,"d":13,"e":14,"f":15]
     func toHex(_ num: Int) -> String {
        guard num != 0 else {
            return "0"
        }
        guard num < 0 else {
            return positiveNumberToHex(num)
        }
        return negativeNumberToHex(num)
     }
    private func positiveNumberToHex(_ num: Int) -> String {
        var ans = ""
        var temp = num
        while temp > 0 {
            let remainder = temp % 16
            ans.insert(remainder < 10 ? Character("\(remainder)") : map[remainder]! , at: ans.startIndex)
            temp = temp / 16
        }
        return ans
    }
    private func negativeNumberToHex(_ num: Int) -> String {
        let positiveNum = 0x7fffffff + num + 1
        var ans = positiveNumberToHex(positiveNum)
        guard !ans.isEmpty else {
            return "80000000"
        }
        var ch = ans.removeFirst()
        if var temp = map2[ch] {
            temp  += 8
            ch = map[temp]!
        }
        ans.insert(ch, at: ans.startIndex)
        return ans
    }
 }