
import Variable
import Tag

#if os(iOS) || os(tvOS) || os(macOS)

public protocol GenericStylist: Stylist {

	associatedtype GenericStyle: Style
    associatedtype Stylable

    func style(stylable: Stylable, style: GenericStyle, tags: [Tag], pair: VariableResolutionPair) throws
}

extension GenericStylist {

    public func style(anyStylable: Any, style: Style, tags: [Tag], pair: VariableResolutionPair) throws {
        guard let genericStyle = style as? GenericStyle else {
            throw StylistError.doesNotHandleStyle(style)
        }

        if let keyPath = Self.keyPath {
            guard let value = anyStylable[keyPath: keyPath] else {
                throw StylistError.failedToExtractStylableByKeyPath(keyPath)
            }
            guard let stylable = value as? Stylable else {
                throw StylistError.stylableTypeMismatched(value)
            }

            try self.style(stylable: stylable, style: genericStyle, tags: tags, pair: pair)
        } else {
            guard let stylable = anyStylable as? Stylable else {
                throw StylistError.stylableTypeMismatched(anyStylable)
            }

            try self.style(stylable: stylable, style: genericStyle, tags: tags, pair: pair)
        }
    }
}

#endif
