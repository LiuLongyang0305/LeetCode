class Q415_Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        if num1.isEmpty || num2.isEmpty {
            return num2 + num1
        }
        let charToInt : Dictionary<Character,Int> = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]
        let intToChar : Array<Character> = ["0","1","2","3","4","5","6","7","8","9"]
        var index1 = num1.index(before: num1.endIndex)
        var index2 = num2.index(before: num2.endIndex)
        let startIndex1 = num1.startIndex
        let startIndex2 = num2.startIndex
        var carry : Int = 0
        var flagNum2End = false
        var flagNum1End = false
        var result = ""
        while !flagNum1End || !flagNum2End {
            let x = flagNum2End ? 0 : charToInt[num2[index2]]!
            let y = flagNum1End ? 0 : charToInt[num1[index1]]!
            if !flagNum2End{
                if index2 == startIndex2 {
                    flagNum2End = true
                } else {
                    index2 = num2.index(before: index2)
                }
            }
            if !flagNum1End{
                if index1 == startIndex1 {
                    flagNum1End = true
                } else {
                    index1 = num1.index(before: index1)
                }
            }
            let temp = x + y + carry
            result.insert(intToChar[temp % 10], at: result.startIndex)
            carry = temp / 10
        }
        if carry != 0 {
            result.insert(intToChar[carry], at: result.startIndex)
        }
        return result
    }
}