class Q443_Solution {
    let intToChar : Array<Character> = ["0","1","2","3","4","5","6","7","8","9"]
    func compress(_ chars: inout [Character]) -> Int {
        if chars.count < 2 {
            return chars.count
        }
        var result = ""
        result.append(chars[0])
        var count = 1
        for i in 1..<chars.count {
            if chars[i] == chars[ i - 1]{
                count += 1
            } else {
                if count != 1 {
                    result += getCountStr(count)
                }
                count = 1
                result.append(chars[i])
            }
        }
        if count > 1 {
            result += getCountStr(count)
        }
        chars = Array<Character>(result)
        return chars.count
    }
    private func getCountStr(_ num : Int) -> String {
        var count = num
        var str = ""
        if count < 10 {
            str.append(intToChar[count])
        } else {
            while count > 0 {
                if str.isEmpty {
                    str.append(intToChar[count % 10])
                } else {
                    str.insert(intToChar[count % 10], at: str.startIndex)
                }
                count /= 10
            }
        }
        return str
    }
}