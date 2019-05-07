class Q917_Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        if S.isEmpty {
            return S
        }
        
        var str = Array<Character>(S)
        let strUtf8Array = Array<UInt8>(S.utf8)
        var i : Int = 0
        var j : Int = str.count - 1
        while i < j {
            while  i < j && !isCharacter(char: strUtf8Array[i]){
                i += 1
            }
            while i < j && !isCharacter(char: strUtf8Array[j]) {
                j -= 1
            }
            if i != j {
                str.swapAt(i, j)
                i += 1
                j -= 1
            }
        }
        return String(str)
    }
    private func isCharacter(char: UInt8) -> Bool {
        return (char >= 65 && char <= 90) || (char >= 97 && char <= 122)
    }
}