class Q345_Solution {
    var vowels : Set<Character> = ["a","e","i","o","u","A","E","O","I","U"]
    func reverseVowels(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        var str = Array<Character>(s)
        var i = 0
        let length = str.count
        var j = length - 1
        while i < j {
            while i < length && !vowels.contains(str[i]) {
                i += 1
            }
            if i == length {
                return String(str)
            }
            while j > i && !vowels.contains(str[j]){
                j -= 1
            }
            if j != i {
                str.swapAt(i, j)
            }
        }
        return String(str)
    }
}