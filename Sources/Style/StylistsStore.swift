
import TypePreservingCodingAdapter

#if os(iOS) || os(tvOS) || os(macOS)

public final class StylistsStore {

    private var stylists = [Alias: Stylist]()

    public init() {}

    @discardableResult
    public func add<GenericStyle: Style>(stylist: Stylist, for: GenericStyle.Type) -> StylistsStore {
        let key = GenericStyle.alias
        stylists[key] = stylist
        return self
    }

    public func access(by key: Alias) -> Stylist? {
        return stylists[key]
    }
}

#endif
