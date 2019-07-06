class Q125_Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var arr = Array<UInt8>()
        for item in s.utf8 {
            if item >= 97 && item <= 122 {
                arr.append(item)
            }
            if item >= 65 && item <= 90 {
                arr.append(item + 32)
            }
            if item >= 48 && item <= 57 {
                arr.append(item)
            }
        }
        
        var i = 0
        var j = arr.count - 1
        while i < j {
            if arr[i] == arr[j] {
                j -= 1
                i += 1
            } else {
                return false
            }
        }
        return true
    }
}