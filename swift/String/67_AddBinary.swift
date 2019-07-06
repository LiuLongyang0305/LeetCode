class Q67_Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        if a.isEmpty || b.isEmpty {
            return a + b
        }
        let charToIntDic : Dictionary<Character,Int> = ["1" : 1, "0": 0]
        let intToCharDic: Dictionary<Int,Character> = [1 : "1", 0 : "0"]
        var result = ""
        var str1Chars = Array<Character>(a)
        var str2Chars = Array<Character>(b)
        var x : Int = 0
        var y : Int = 0
        var carry : Int = 0
        while !str1Chars.isEmpty || !str2Chars.isEmpty {
            x = str1Chars.isEmpty ? 0 : charToIntDic[str1Chars.removeLast()]!
            y = str2Chars.isEmpty ? 0 : charToIntDic[str2Chars.removeLast()]!
            let temp = x + y + carry
            result.insert((intToCharDic[temp % 2]!), at: result.startIndex)
            carry =  temp / 2
        }
        if carry == 1 {
            result.insert("1", at: result.startIndex)
        } else if carry == 2{
            result.insert("0", at: result.startIndex)
            result.insert("1", at: result.startIndex)
        }
        return result
    }
}