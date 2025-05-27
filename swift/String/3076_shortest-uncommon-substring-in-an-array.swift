// https://leetcode.cn/problems/shortest-uncommon-substring-in-an-array
class Solution {
    func shortestSubstrings(_ arr: [String]) -> [String] {

        var counter = [String:Int]()
        for s in arr {
            counter[s,default: 0] += 1
        }

        func check(_ str: String, _ subStrLength: Int) -> String?{
            let sortedStrs = str.windows(ofCount: subStrLength).map { String($0)}.sorted()
            for subStr in sortedStrs {
                var flag = true
                for s in arr {
                    guard s != str else {continue}
                    guard !s.contains(subStr) else  {
                        flag = false
                        break
                    }
                }
                if flag {
                    return subStr
                }
            }
            return nil
        }


        func getMinLenthUniqueSubstr(of str: String) -> String {
            var ans = ""
            var l = 1
            var h = str.count
            while l < h {
                let mid = (l + h) >> 1
                if let s = check(str, mid) {
                    h = mid
                } else {
                    l = mid + 1
                }
            }
            return check(str, l) ?? ""
        }



        return arr.map { return counter[$0]! > 1 ? "" : getMinLenthUniqueSubstr(of: $0)
        }
    }
}
