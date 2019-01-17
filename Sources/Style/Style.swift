
import TypePreservingCodingAdapter

public protocol Style: Codable {

    static var alias: Alias { get }
}

#if os(iOS) || os(tvOS) || os(macOS)

extension Style {

	public func stylist(from store: StylistsStore) -> Stylist? {
        return store.access(by: Self.alias)
	}
}

#endif
