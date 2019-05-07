class Q242_Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        typealias Count = (inSource:Int,inTarget: Int)
        var charCount = Dictionary<Character,Count>()
        var index = s.startIndex
        while index != s.endIndex {
            if nil == charCount[s[index]] {
                charCount[s[index]] = (1,0)
            } else {
                charCount[s[index]]!.inSource = (charCount[s[index]]?.inSource)! + 1
            }
            index = s.index(after: index)
        }
        index = t.startIndex
        while index < t.endIndex {
            if nil == charCount[t[index]]{
                return false
            } else {
                charCount[t[index]]!.inTarget = (charCount[t[index]]?.inTarget)! + 1
            }
            index = t.index(after: index)
        }
        //        for (_ ,value) in charCount {
        //            if value.inSource != value.inTarget {
        //                return false
        //            }
        //        }
        let result = charCount.filter { (arg0) -> Bool in
            let (_, value) = arg0
            return value.inSource != value.inTarget
        }
        return result.count > 0
    }
}