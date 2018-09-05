//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

extension String {
    func addingPercent() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

let testString = "<>%#"
testString.addingPercent()


func encodeParametersInUrl(_ parameters: [String:Any]) -> String {
    var components = [(String, String)]()
    let sortedKeys = parameters.keys.sorted(by: {$0 < $1} )
    
    for key in sortedKeys {
        let value = parameters[key]!
        let queryComponents = queryComponentsWith(Key: key, value: value)
        components.append(contentsOf: queryComponents)
        
    }
    let encodedComponents = components.map { "($0) = \($1)" }
    return encodedComponents.joined(separator: "&")
    
}

func queryComponentsWith(Key: String, value: Any) -> [(String, String)] {
    var components = [(String, String)]()
    
    if let dictionary = value as? [String: Any] {
        for (nestedKey, value) in dictionary {
             let nestedComponents = queryComponentsWith(Key: "\(Key)[\(nestedKey)]", value: value)
            components.append(contentsOf: nestedComponents)
        }
    } else
        if let array = value as? [Any] {
            for value in array {
                let nestedComponents = queryComponentsWith(Key: "\(Key)[]", value: value)
                components.append(contentsOf: nestedComponents)
            }
        }
        else {
            let encodedKey = Key.addingPercent()
            let encocodedValue = "\(value)".addingPercent()
            let component = (encodedKey, encocodedValue)
            components.append(component)
        }
        
    return components
    
}


let parameters = ["Foo": true ]

encodeParametersInUrl(parameters)

let multipleParameters = ["Foo": "Bar", "Baz" : "Quz"]

encodeParametersInUrl(multipleParameters)

let specialParameters = [ "Foo": "<>test12"]
encodeParametersInUrl(specialParameters)
let dictionary = ["foo" : ["bar": 1]]

encodeParametersInUrl(dictionary)

let arrayParameters = ["Foo": ["a", 1, true]]
encodeParametersInUrl(arrayParameters)



