//https://leetcode.com/problems/validate-ip-address/
enum IpAddressTypes: String {
    case IPv4 = "IPv4"
    case IPv6 = "IPv6"
    case Neither = "Neither"
}

let charToInt : Dictionary<Character,Int> = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"a":10,"b":11,"c":12,"d":13,"e":14,"f":15]

class Solution {
    func validIPAddress(_ IP: String) -> String {
        if IP.contains(".") {
            return validIpv4(ipv4: IP)
        }
        return validIpv6(ipv6: IP)
    }
    
    private func validIpv4(ipv4: String) -> String {
        let parts = ipv4.components(separatedBy: CharacterSet(charactersIn: "."))
        if parts.count != 4 {
            return IpAddressTypes.Neither.rawValue
        }
        for part in parts {
            let size = part.count
            if size > 3 {
                return IpAddressTypes.Neither.rawValue
            }
            let limit = [0,-1,9,99]
            if let num = Int(part)  {
                if !(num > limit[size] && num < 256) {
                    return IpAddressTypes.Neither.rawValue
                }
            } else {
                return  IpAddressTypes.Neither.rawValue
            }
        }
        return IpAddressTypes.IPv4.rawValue
    }
    
    private func validIpv6(ipv6: String) -> String {
        let parts = ipv6.components(separatedBy: CharacterSet(charactersIn: ":"))
        if parts.count != 8 {
            return IpAddressTypes.Neither.rawValue
        }
        for part in parts {
            if part.isEmpty {
                return IpAddressTypes.Neither.rawValue
            }
            let size = part.count
            if size > 4 {
                return  IpAddressTypes.Neither.rawValue
            }
            if let num = getHexValueFromString(str: part.lowercased()){
                if num >= 65536 {
                    return IpAddressTypes.Neither.rawValue
                }
            } else {
                return IpAddressTypes.Neither.rawValue
            }

        }
        return IpAddressTypes.IPv6.rawValue
    }
    
    private func getHexValueFromString(str: String) -> Int? {
        var ans = 0
        for ch in str {
            if let temp = charToInt[ch] {
                ans = ans << 4 + temp
            } else {
                return nil
            }
        }
        return ans
    }
}

Solution().validIPAddress("2001:db8:85a3:0::8a2E:0370:7334")
