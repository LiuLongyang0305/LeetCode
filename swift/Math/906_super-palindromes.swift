// https://leetcode.com/problems/super-palindromes/
class Solution {
    private let  potensions = [0, 1, 4, 9, 121, 10201, 12321, 14641, 484, 40804, 44944, 1002001, 100020001, 102030201, 104060401, 1234321, 121242121, 123454321, 125686521, 4008004, 400080004, 404090404, 10000200001, 1000002000001, 1002003002001, 1004006004001, 10221412201, 1020304030201, 1022325232201, 1024348434201, 12102420121, 1210024200121, 1212225222121, 1214428244121, 12345654321, 1232346432321, 1234567654321, 40000800004, 4000008000004, 4004009004004, 100000020000001, 10000000200000001, 10002000300020001, 10004000600040001, 100220141022001, 10020210401202001, 10022212521222001, 10024214841242001, 102012040210201, 10201020402010201, 10203040504030201, 10205060806050201, 102234363432201, 10221432623412201, 10223454745432201, 121000242000121, 12100002420000121, 12102202520220121, 12104402820440121, 121242363242121, 12122232623222121, 12124434743442121, 123212464212321, 12321024642012321, 12323244744232321, 123456787654321, 12343456865434321, 12345678987654321, 400000080000004, 40000000800000004, 40004000900040004]
//    private  static var nums = [Int]()
//    init() {
//        for halfLength in 0...4 {
//            update(halfLength)
//        }
//    }
//    private func isPalindromes(_ s: String) -> Bool {
//        var l = s.startIndex
//        var r = s.index(before: s.endIndex)
//        while l < r {
//            guard s[l] == s[r] else {
//                return false
//            }
//            l = s.index(after: l)
//            r = s.index(before: r)
//        }
//        return true
//    }
//    private func check(_ s: String) {
//
//        let num = Int(s)!
//        let s1 = num * num
//
//        print("\(#function)   s = \(s)  s1 = \(s1)")
//        if isPalindromes("\(s1)") {
//            Solution.nums.append(s1)
//        }
//    }
//
//    private  func update(_ halfLength: Int) {
//        guard halfLength > 0 else {
//            for num in 0...9 {
//                check("\(num)")
//            }
//            return
//        }
//        let leftLimit = halfLength == 1 ? 0 : (Int("1" + String(String(repeating: "0", count: halfLength - 1)) )!)
//        let rightLimit =  Int(String(repeating: "9", count: halfLength))!
//            for half in leftLimit...rightLimit {
//            let l = "\(half)"
//            let reverse = String(l.reversed())
//            check(l + reverse)
//            for mid in 0...9 {
//                check(l + "\(mid)" + reverse)
//            }
//        }
//    }
    
    func superpalindromesInRange(_ left: String, _ right: String) -> Int {
        
        let low = Int(left)!
        let high = Int(right)!
        
        var cnt = 0
        for num in potensions {
            if num >= low && num <= high {
                cnt += 1
            }
        }
        return cnt
    }
}


