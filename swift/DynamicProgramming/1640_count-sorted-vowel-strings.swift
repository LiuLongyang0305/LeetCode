// https://leetcode.com/problems/count-sorted-vowel-strings/
class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var counter: (a:Int,e:Int,i:Int,o:Int,u:Int) = (1,1,1,1,1)
        for _ in 1..<n {
            counter.e += counter.a
            counter.i += counter.e
            counter.o += counter.i
            counter.u += counter.o
        }
        return counter.a + counter.e + counter.i + counter.o + counter.u
    }
}