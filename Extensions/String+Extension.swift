//
//  String+Extension.swift
//  ImageSearcher
//
//  Created by Bastin Soosairaj on 7/8/24.
//

import Foundation

extension String {
    func convertHtmlToAtttibutedString() -> NSAttributedString? {
        guard let htmlData = self.data(using: .utf8) else { return nil }
        let resultStr = try? NSAttributedString(data: htmlData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        return resultStr ?? nil
    }
    
    func formattedVersion() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSZ"
        guard let date = dateFormatter.date(from: self) ?? nil else { return nil }
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let expectedDate = dateFormatter.string(from: date)
        return expectedDate
    }
}
