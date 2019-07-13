//https://leetcode.com/problems/restore-ip-addresses/
class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count >=  4  &&  s.count < 13 else {
            return [String]()
        }
        var ans = [String]()
        let size = s.count
        let sCopy = Array<Character>(s)
        for i in 1...3 {
            for j in 1...3 {
                for k in 1...3 {
                    let m = size - i - j - k
                    if m >= 1 && m <= 3  {
                        let part1 = String(sCopy[0..<i])
                        if !validComponent(compoment: part1) {
                            continue
                        }
                        let  part2 = String(sCopy[i..<(i + j)])
                        if !validComponent(compoment: part2) {
                            continue
                        }
                        let part3 = String(sCopy[(i + j)..<(i + j + k)])
                        if !validComponent(compoment: part3) {
                            continue
                        }
                        let part4 = String(sCopy[(i + j + k)..<size])
                        if !validComponent(compoment: part4) {
                            continue
                        }
                        ans.append( part1 + "." + part2 + "." + part3 + "." + part4)
                    }
                }
            }
        }
        return ans
    }
    
    private  func validComponent(compoment: String) -> Bool {
        if compoment.count != 1 {
            if compoment.first! == "0" {
                return false
            }
        }
        if compoment.count == 3  {
            if Int(compoment)! > 255 {
                return false
            }
        }
        return true
    }
}

