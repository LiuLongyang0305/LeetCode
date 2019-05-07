class Q13_Solution {
    let charToInt: Dictionary<Character, Int> = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    let stringToInt : Dictionary<String,Int> = ["IV":4,"Ix":9,"XL":40,"XC":90,"CD":500,"CM":900]
    let set : Set<Character> = ["I","X","C"]
    func romanToInt(_ s: String) -> Int {
        var result : Int = 0
        var index = s.startIndex
        while index < s.endIndex {
            if set.contains(s[index]) && s.index(after: index) < s.endIndex{
                let tempIndex = s.index(after: index)
                var str = String(s[index])
                str.append(s[tempIndex])
                if let val =  stringToInt[str] {
                    result += val
                    index = s.index(after: tempIndex)
                } else {
                    result += charToInt[s[index]]!
                    index = tempIndex
                }
            } else {
                result += charToInt[s[index]]!
                index = s.index(after: index)
            }
        }
        return result
    }
}