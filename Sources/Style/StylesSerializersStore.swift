
import Foundation

#if os(iOS) || os(tvOS) || os(macOS)

public final class StylesSerializersStore {

    public typealias Serializer = (Data) throws -> Style
    private var serializers = [String: Serializer]()
    private var decoder: JSONDecoder

    public init(decoder: JSONDecoder) {
        self.decoder = decoder
    }

    @discardableResult
    public func register<GenericStyle: Style>(_ style: GenericStyle.Type) -> StylesSerializersStore {
        let key = String(reflecting: GenericStyle.self)

        serializers[key] = { [unowned self] data throws -> GenericStyle in
            return try self.decoder.decode(GenericStyle.self, from: data)
        }
        return self
    }

    public func access(key: String) -> Serializer? {
        return serializers[key]
    }
}

#endif
