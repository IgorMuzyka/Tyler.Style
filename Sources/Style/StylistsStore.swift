
#if os(iOS) || os(tvOS) || os(macOS)

public final class StylistsStore {

    private var stylists = [String: Stylist]()

    public init() {}

	@discardableResult
    public func add<GenericStyle: Style>(stylist: Stylist, for: GenericStyle.Type) -> StylistsStore {
        let key = String(reflecting: GenericStyle.self)
        stylists[key] = stylist
		return self
    }

    public func access(key: String) -> Stylist? {
        return stylists[key]
    }
}

#endif
