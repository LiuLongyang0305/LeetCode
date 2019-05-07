class Q557_Solution {
    func reverseWords(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        var result = ""
        let subStrs = s.split(separator: " ")
        for substr in subStrs {
            let reverseWord = reverseSubString(sourceStr: substr)
            result += reverseWord
        }
        result.removeLast()
        return result
    }
    private func reverseSubString(sourceStr: Substring) -> String{
        var arr = Array<Character>(sourceStr)
        var j = 0
        var k = sourceStr.count - 1
        while j < k {
            arr.swapAt(j, k)
            j += 1
            k -= 1
        }
        arr.append(" ")
        return String(arr)
    }
}