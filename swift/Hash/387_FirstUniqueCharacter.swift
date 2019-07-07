class Q387_Solution {
    func firstUniqChar(_ s: String) -> Int {
        var set = Set<Character>()
        var doubled = Set<Character>()
        for ch in s {
            if set.contains(ch) {
                set.remove(ch)
                doubled.insert(ch)
            } else {
                if !doubled.contains(ch) {
                    set.insert(ch)
                }
            }
        }
        //        for (index,ch) in s.enumerated() {
        //            if set.contains(ch) {
        //                return index
        //            }
        //        }
        var index = 0
        for ch in s {
            if set.contains(ch){
                return index
            }
            index += 1
        }
        return -1
    }
}