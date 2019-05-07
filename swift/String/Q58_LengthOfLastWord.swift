class Q58_Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var temp = s
        while !temp.isEmpty && temp.first! == " " {
            temp.removeFirst()
        }
        while !temp.isEmpty && temp.last! == " "  {
            temp.removeLast()
        }
        if temp.isEmpty {
            return 0
        }
        if let index = temp.lastIndex(of: " ") {
            return temp.distance(from: index, to: temp.endIndex)
        }
        return temp.count
    }
}