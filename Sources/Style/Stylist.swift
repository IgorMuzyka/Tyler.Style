
import Variable
import Tag

#if os(iOS) || os(tvOS) || os(macOS)

public protocol Stylist {

	func style(anyStylable: Any, style: Style, tags: [Tag], pair: VariableResolutionPair) throws

    static var keyPath: AnyKeyPath? { get }
}

#endif
