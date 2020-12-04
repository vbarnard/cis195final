// from https://rosettacode.org/wiki/Markov_chain_text_generator#Swift

class Markov {
    func makeRule(input: String, keyLength: Int) -> [String: [String]] {
      let words = input.components(separatedBy: " ")
      var rules = [String: [String]]()
      var i = keyLength
     
      for word in words[i...] {
        let key = words[i-keyLength..<i].joined(separator: " ")
     
        rules[key, default: []].append(word)
     
        i += 1
      }
     
      return rules
    }
     
    func makeString(rule: [String: [String]], length: Int) -> String {
      var oldWords = rule.keys.randomElement()!.components(separatedBy: " ")
      var string = oldWords.joined(separator: " ") + " "
     
      for _ in 0..<length {
        let key = oldWords.joined(separator: " ")
        guard let newWord = rule[key]?.randomElement() else { return string }
     
        string += newWord + " "
     
        for ii in 0..<oldWords.count {
          oldWords[ii] = oldWords[(ii + 1) % oldWords.count]
        }
     
        oldWords[oldWords.index(before: oldWords.endIndex)] = newWord
      }
     
      return string
    }
}


