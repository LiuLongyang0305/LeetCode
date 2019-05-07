class Q824_Solution {
    var vowels : Set<Character> = ["a","e","i","o","u","A","E","I","O","U"]
    func toGoatLatin(_ S: String) -> String {
        var result = ""
        let subStrs = S.split(separator: " ")
        var  suffix  = "a"
        for item in subStrs {
            var temp = item
            if !vowels.contains(temp.first!) {
                let char = temp.removeFirst()
                temp.append(char)
            }
            result += (temp + "ma" + suffix + " ")
            suffix += "a"
        }
        result.removeLast()
        return result
    }
}