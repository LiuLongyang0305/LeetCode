//  https://leetcode.com/problems/minimum-flips-to-make-a-or-b-equal-to-c/
class Solution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        
        var aArr = [Character](String(a, radix: 2, uppercase: false)).map {$0 == "1"}
        var bArr = [Character](String(b, radix: 2, uppercase: false)).map {$0 == "1"}
        var cArr = [Character](String(c, radix: 2, uppercase: false)).map {$0 == "1"}
        let length = max(aArr.count, bArr.count,cArr.count)
        if aArr.count < length {
            aArr.insert(contentsOf: Array<Bool>(repeating: false, count: length - aArr.count), at: 0)
        }
        if bArr.count < length {
            bArr.insert(contentsOf: Array<Bool>(repeating: false, count: length - bArr.count), at: 0)
        }
        if cArr.count < length {
            cArr.insert(contentsOf: Array<Bool>(repeating: false, count: length - cArr.count), at: 0)
        }
        var count = 0
        for i in 0..<length {
            if cArr[i] {
                if !aArr[i] && !bArr[i] {
                    count += 1
                }
            } else {
                if aArr[i] {
                    count += 1
                }
                if bArr[i] {
                    count += 1
                }
            }
        }
        return count
    }
 }