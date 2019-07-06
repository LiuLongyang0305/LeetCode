class Q551_Solution {
    func checkRecord(_ s: String) -> Bool {
        let first = s.firstIndex(of: "A")
        let last = s.lastIndex(of: "A")
        guard nil == first || last == first else {
            return false
        }
        var index = s.firstIndex(of: "L")
        guard nil != index else {
            return true
        }
        let endIndex = s.lastIndex(of: "L")
        guard index != endIndex else {
            return true
        }
        
        while index! < endIndex! {
            if s[index!] == "L" {
                let next = s.index(after: index!)
                if next != s.endIndex{
                    if s[next] == "L" {
                        let temp = s.index(after: next)
                        if temp != s.endIndex {
                            if s[temp] == "L" {
                                return false
                            }
                        }
                    }
                }
            }
            index = s.index(after: index!)
        }
        return true
    }
}