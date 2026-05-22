//    //https://leetcode.cn/problems/merge-close-characters/
//     class Solution {
//         func mergeCharacters(_ s: String, _ k: Int) -> String {
//             var map = [Character:[Int]]()
//             var curIdx = 0
//             for ch in s {
//                 if  var indices = map[ch] {
//                     let last = indices.last!
//                     if curIdx - last > k {
//                         indices.append(curIdx)
//                         map[ch] = indices
//                         curIdx += 1
//                     }

//                 } else {
//                     map[ch,default: []].append(curIdx)
//                     curIdx += 1
//                 }
//             }
//             var chars = [Character](repeating: " ", count: curIdx)
//             for (ch,indices) in map {
//                 for idx in indices {
//                     chars[idx] = ch
//                 }
//             }
//             return String(chars)
//         }
//     }

  //https://leetcode.cn/problems/merge-close-characters/
    class Solution {
        func mergeCharacters(_ s: String, _ k: Int) -> String {
            var map = [Character:Int]()
            var sb = ""
            var curIdx = 0
            for ch in s {
                if let lastIdx = map[ch] {
                    if curIdx - lastIdx > k {
                        sb.append(ch)
                        map[ch] = curIdx
                        curIdx += 1
                    }
                } else {
                    sb.append(ch)
                    map[ch] = curIdx
                    curIdx += 1
                }
            }

            return sb
        }
    }
