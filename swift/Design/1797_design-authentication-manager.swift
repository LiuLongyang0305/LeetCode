// https://leetcode.com/problems/design-authentication-manager/
struct Token {
    var id: String
    var experiodTime: Int
}

class AuthenticationManager {
    
    private let timeToLive:Int
    private var tokens = [Token]()
    private var unexperiodTokens = [String:Int]()
    
    init(_ timeToLive: Int) {
        self.timeToLive = timeToLive
    }
    
    func generate(_ tokenId: String, _ currentTime: Int) {
        cleanTokens(currentTime)
        let token = Token(id: tokenId, experiodTime: currentTime + self.timeToLive)
        insert(token)
    }
    
    func renew(_ tokenId: String, _ currentTime: Int) {
        cleanTokens(currentTime)
        guard let t = unexperiodTokens[tokenId] else  {return}
        let token = Token(id: tokenId, experiodTime: t)
        if let idx = binarySearch(token) {
            tokens.remove(at: idx)
            insert(Token(id: tokenId, experiodTime: currentTime + timeToLive))
        }
    }
    
    func countUnexpiredTokens(_ currentTime: Int) -> Int {
        cleanTokens(currentTime)
        return tokens.count
    }
    
    
    private func  insert(_ token: Token) {
        unexperiodTokens[token.id] = token.experiodTime
        guard !tokens.isEmpty else {
            tokens.append(token)
            return
        }
        if let idx = binarySearch(token) {
            if idx == 0 {
                tokens.insert(token, at: 0)
            } else if idx == tokens.count {
                tokens.append(token)
            } else {
                tokens.insert(token, at: idx)
            }
        }
    }
    private func  binarySearch(_ token: Token) -> Int? {
        guard !tokens.isEmpty else {return nil}
        guard tokens[0].experiodTime <= token.experiodTime else {return 0}
        guard tokens.last!.experiodTime >= token.experiodTime else {return tokens.count}
        var left = 0
        var right = tokens.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if tokens[mid].experiodTime >= token.experiodTime {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    private func cleanTokens(_ currentTime: Int) {
        while !tokens.isEmpty && tokens[0].experiodTime <= currentTime {
            unexperiodTokens.removeValue(forKey: tokens[0].id)
            tokens.removeFirst()
        }
    }
}
/**
 * Your AuthenticationManager object will be instantiated and called as such:
 * let obj = AuthenticationManager(timeToLive)
 * obj.generate(tokenId, currentTime)
 * obj.renew(tokenId, currentTime)
 * let ret_3: Int = obj.countUnexpiredTokens(currentTime)
 */