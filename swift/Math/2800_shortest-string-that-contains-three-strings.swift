//https://leetcode.com/problems/shortest-string-that-contains-three-strings/
extension String {
    func isSubstring(of str: String) -> Bool {
        return str.contains(self)
    }
}

class Solution {
    func minimumString(_ a: String, _ b: String, _ c: String) -> String {
        var sortedStrs = [a,b,c].sorted {$0.count < $1.count}
        var removed = [Bool](repeating: false, count: 3)
        for i in 0..<3 {
            var j  = i + 1
            while j < 3 {
                if sortedStrs[i].isSubstring(of: sortedStrs[j]) {
                    removed[i] = true
                    break
                }
                j += 1
            }
        }

        for i in [2,1,0] {
            if removed[i] {
                sortedStrs.remove(at: i)
            }
        }
        return  minimumString(sortedStrs)
    }

    func minimumString(_ strs: [String]) -> String {
        guard strs.count > 1  else {
            return strs[0]
        }


        func join(_ indices:[Int]) -> String {
            var ans = strs[indices[0]]
            for idx in indices.dropFirst() {
                ans = connect(ans, strs[idx])
            }
            
            return ans
        }



        var ans = Set<String>()

        let N = strs.count
        for indices in (0..<N).permutations() {
            ans.insert(join(indices))
        }
        // print("\(strs)  \(ans)")
        return ans.sorted { s1, s2 in
            if s1.count == s2.count {
                return s1 < s2
            }
            return s1.count < s2.count
        }.first!
    }

     func connect(_ str1:String, _ str2: String) -> String {
        // print("\(#function)  before: s1 = \(str1)  s2 = \(str2)")
        // if str1.last! != str2.first! {return str1 + str2}
         if str2.isSubstring(of: str1) {return str1}
        var ans = ""
        var left = ""
        var right = str1
        while !right.isEmpty {
            if str2.hasPrefix(right) {
                break
            }
            left.append(right.removeFirst())
        }
        // print("\(#function)  ans = \(left + str2)")
        return left + str2
    }

}
