//
//  XMLParser.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/9/24.
//

import Foundation

// TO-DO. Parser class to extract image width and height from HTML string
class ParserXml: NSObject, XMLParserDelegate {
    var imageWidthHeight = (0, 0)
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    }
    
    func parser(_ parser: XMLParser, foundExternalEntityDeclarationWithName name: String, publicID: String?, systemID: String?) {
    }
    
    func parser(_ parser: XMLParser, foundNotationDeclarationWithName name: String, publicID: String?, systemID: String?) {
    }
    
    func parser(_ parser: XMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?) {
    }
    
    func parser(_ parser: XMLParser, foundElementDeclarationWithName elementName: String, model: String) {
        print("foundElementDeclarationWithName: elementName \(elementName)")
        print("foundElementDeclarationWithName: model \(model)")
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("foundCharacters: string \(string)")
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("END elementName: \(elementName)")
    }
}

class Parser {
    static let instance = Parser()
    
    func getImageDimension(htmlString: String) -> (Int, Int) {
        guard let htmlData = htmlString.data(using: .utf8) else { return (0, 0) }
        let xmlParser = XMLParser(data: htmlData)
        let parser = ParserXml()
        xmlParser.delegate = parser
        _ = xmlParser.parse()
        return (50, 100) // Hardcoded. Html content is not proper hence parsing is failing. Need more work
    }
}
