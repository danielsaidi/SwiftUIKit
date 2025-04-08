import SwiftUI

@available(*, deprecated, message: "This view has been moved to the https://github.com/danielsaidi/TextReplacementView repository.")
public struct TextReplacement: View {
    
    /// Create a replacement view with a single replacement.
    public init(
        _ text: String,
        replace: String,
        with replacement: @escaping (String) -> Text
    ) {
        self.init(text, replacements: [replace: replacement])
    }
    
    /// Create a replacement view with multiple replacements.
    public init(
        _ text: String,
        replacements: [String: (String) -> Text]
    ) {
        self.content = TextReplacement.processReplacements(
            in: text,
            with: replacements
        )
    }
    
    private let content: Text
    
    public var body: some View {
        content
    }
    
    /// Process the replacements in a deterministic way
    private static func processReplacements(
        in text: String,
        with replacements: [String: (String) -> Text]
    ) -> Text {
        
        // Create a structure to track replacement positions
        struct Replacement {
            let range: Range<String.Index>
            let pattern: String
            let replacementFunc: (String) -> Text
        }
        
        // Find all occurrences of all patterns
        var allReplacements: [Replacement] = []
        
        // Find text ranges for all specified replacements
        for (pattern, replacementFunc) in replacements {
            var searchRange = text.startIndex..<text.endIndex
            
            while let range = text.range(of: pattern, range: searchRange) {
                allReplacements.append(Replacement(
                    range: range,
                    pattern: pattern,
                    replacementFunc: replacementFunc
                ))
                searchRange = range.upperBound..<text.endIndex
            }
        }
        
        // Sort replacements by position, then by length
        // Longer patterns are handled first to handle overlaps
        allReplacements.sort { first, second in
            if first.range.lowerBound != second.range.lowerBound {
                return first.range.lowerBound < second.range.lowerBound
            }
            return first.pattern.count > second.pattern.count
        }
        
        // Process the text with non-overlapping replacements
        var result = Text("")
        var currentIndex = text.startIndex
        
        // Remove overlapping replacements
        var validReplacements: [Replacement] = []
        var lastEnd: String.Index?
        
        for replacement in allReplacements {
            if let lastEnd = lastEnd, replacement.range.lowerBound < lastEnd {
                continue // Skip overlapping replacement
            }
            validReplacements.append(replacement)
            lastEnd = replacement.range.upperBound
        }
        
        // Apply the valid replacements
        for replacement in validReplacements {
            // Add text before the replacement
            if currentIndex < replacement.range.lowerBound {
                let beforeText = text[currentIndex..<replacement.range.lowerBound]
                result = result + Text(String(beforeText))
            }
            
            // Add the replacement
            result = result + replacement.replacementFunc(replacement.pattern)
            currentIndex = replacement.range.upperBound
        }
        
        // Add any remaining text
        if currentIndex < text.endIndex {
            let remainingText = text[currentIndex..<text.endIndex]
            result = result + Text(String(remainingText))
        }
        
        return result
    }
}
