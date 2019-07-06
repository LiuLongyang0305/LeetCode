class Q20_Solution {
    let parenthesesPairs : Dictionary<Character,Character> = ["}":"{",")":"(","]":"["]
    func isValid(_ s: String) -> Bool {
        var parentheses : Array<Character> = Array<Character>()
        for char in s {
            if char == "{" || char == "["  || char == "(" {
                parentheses.append(char)
            } else {
                if parentheses.isEmpty{
                    return false
                }
                let last = parentheses.removeLast()
                if last != parenthesesPairs[char]{
                    return false
                }
            }
        }
        return parentheses.isEmpty
    }
}