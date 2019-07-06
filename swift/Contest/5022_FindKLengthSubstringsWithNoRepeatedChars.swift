class Solution {
    func numKLenSubstrNoRepeats(_ S: String, _ K: Int) -> Int {
        guard S.count >= K else {
            return 0
        }
        var result = 0
        var arr = Array<Character>(S)
        
        var i = 0
        var j = K - 1

        while j < S.count {
            if Set<Character>(arr[i...j]).count == K {
                result += 1
            }
            i += 1
            j += 1
        }
        return result
    }
}