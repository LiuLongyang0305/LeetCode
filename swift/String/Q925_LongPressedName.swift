class Q925_Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        let nameCount = name.count
        let typeCount = typed.count
        guard nameCount <= typeCount else {
            return false
        }
        guard !name.isEmpty && !typed.isEmpty else {
            return false
        }
        
        let nameChars = Array<Character>(name)
        let typedChars = Array<Character>(typed)
        guard nameChars[0] == typedChars[0] else {
            return false
        }
        var i : Int = 1
        var j : Int = 1
        
        while i < nameCount && j < typeCount{
            if nameChars[i] != typedChars[j] {
                if typedChars[j] != typedChars[j - 1]{
                    return false
                }
                j += 1
            } else {
                i += 1
                j += 1
            }
        }
        if i < nameCount {
            return false
        }
        while j < typeCount {
            if typedChars[j] != typedChars[j - 1] {
                return false
            } else {
                j += 1
            }
        }
        
        return true
    }
}