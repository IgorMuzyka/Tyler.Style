
public protocol Style: Codable {}

#if os(iOS) || os(tvOS) || os(macOS)

extension Style {

	public func stylist(from store: StylistsStore) -> Stylist? {
		return store.access(key: String(reflecting: type(of: self)))
	}
}

#endif
