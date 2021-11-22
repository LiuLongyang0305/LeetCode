// https://leetcode.com/problems/sum-of-k-mirror-numbers/
class Solution {
   // private var powOfTen = [1]
    private let mirrorNumbersPreffix = [[0], [0], [0, 1, 4, 9, 16, 25, 58, 157, 470, 1055, 1772, 9219, 18228, 33579, 65802, 105795, 159030, 212865, 286602, 872187, 2630758, 4565149, 6544940, 9674153, 14745858, 20005383, 25846868, 39347399, 759196316, 1669569335, 2609044274], [0, 1, 3, 7, 15, 136, 287, 499, 741, 1225, 1881, 2638, 31730, 80614, 155261, 230718, 306985, 399914, 493653, 1342501, 2863752, 5849644, 9871848, 14090972, 18342496, 22630320, 28367695, 36243482, 44192979, 71904751, 155059889], [0, 1, 3, 6, 11, 66, 439, 832, 1498, 2285, 3224, 11221, 64456, 119711, 175366, 233041, 739646, 2540727, 4755849, 8582132, 12448815, 17500320, 22726545, 27986070, 33283995, 38898160, 44577925, 98400760, 721411086, 1676067545, 53393239260], [0, 1, 3, 6, 10, 16, 104, 356, 638, 1264, 1940, 3161, 18912, 37793, 10125794, 20526195, 48237967, 78560270, 126193944, 192171900, 1000828708, 1832161846, 2664029984, 3500161622, 4336343260, 6849225412, 9446112364, 12339666346, 19101218022, 31215959143, 43401017264], [0, 1, 3, 6, 10, 15, 22, 77, 188, 329, 520, 863, 1297, 2074, 2942, 4383, 12050, 19827, 41849, 81742, 156389, 325250, 1134058, 2043967, 3911648, 7009551, 11241875, 15507499, 19806423, 24322577, 28888231], [0, 1, 3, 6, 10, 15, 21, 29, 150, 321, 563, 855, 17416, 83072, 2220384, 6822448, 13420404, 20379000, 29849749, 91104965, 321578997, 788407661, 1273902245, 1912731081, 2570225837, 3428700695, 29128200347, 69258903451, 115121130305, 176576075721, 241030621167], [0, 1, 3, 6, 10, 15, 21, 28, 37, 158, 450, 783, 1156, 1570, 2155, 5818, 14596, 27727, 41058, 67520, 94182, 124285, 154588, 362290, 991116, 1651182, 3148123, 5083514, 7054305, 11253219, 66619574], [0, 1, 3, 6, 10, 15, 21, 28, 36, 227, 509, 882, 1346, 1901, 2547, 3203, 10089, 35841, 63313, 105637, 156242, 782868, 2323319, 4036490, 5757761, 7586042, 9463823, 11349704, 13750746, 16185088, 18627530]]
    init(){
       // for _ in 1...18 {
       //     powOfTen.append(powOfTen.last! * 10)
       // }
//        var isSatisfied = [Bool](repeating: false, count: 10)
//        isSatisfied[0] = true
//        isSatisfied[1] = true
//        var last = 0
//        while isSatisfied.contains(false) {
//            let num = nextPalindromebase10(last)
//            for base in 2...9 {
//                guard !isSatisfied[base] else {
//                    continue
//                }
//                if isPalindromebase(base, num) {
//                    let l = mirrorNumbers[base].last!
//                    mirrorNumbers[base].append(num + l)
//                    if mirrorNumbers[base].count == 31 {
//                        isSatisfied[base] = true
//                    }
//                }
//            }
//            last = num
//        }
    }
    func kMirror(_ k: Int, _ n: Int) -> Int {
        return mirrorNumbersPreffix[k][n]
    }
    
    
   //   private func nextPalindromebase10(_ val: Int) -> Int {
   //     let str = "\(val)"
   //     let N = str.count
   //     let leftStr = String(str.prefix((N + 1) >> 1))
   //     let leftNum = Int(leftStr)! + 1
   //     let newLeftStr = "\(leftNum)"
   //     var rightStr = String(newLeftStr.reversed())
   //     if N & 1 != 0 {
   //         rightStr.removeFirst()
   //     }
   //     return min(powOfTen[N] + 1, Int(newLeftStr + rightStr)!)
   // }
    
    private func isPalindromebase(_ k: Int, _ value: Int) -> Bool {
        var digits = [Int]()
        var v = value
        while v > 0 {
            digits.append(v % k)
            v /= k
        }
        var i = 0
        var j = digits.count - 1
        while i < j {
            guard digits[i] == digits[j] else {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}