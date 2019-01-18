
import TypePreservingCodingAdapter

extension TypePreservingCodingAdapter {

    public func register<GenericStyle: Style>(style: GenericStyle.Type) -> TypePreservingCodingAdapter {
        register(type: GenericStyle.self)
        register(alias: GenericStyle.alias, for: GenericStyle.self)
        return self
    }
}
