class Q680_Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array<Character>(s)
        var i = 0
        var j = chars.count - 1
        while i < j {
            if chars[i] != chars[j] {
                return isPalindromeRange(arr: chars, start: i + 1, end: j) || isPalindromeRange(arr: chars, start: i, end: j - 1)
            }
            i += 1
            j -= 1
        }
        return true
    }
    private func isPalindromeRange(arr : [Character], start : Int, end : Int) -> Bool {
        var i = start
        var j = end
        while i < j {
            if arr[i] != arr[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}