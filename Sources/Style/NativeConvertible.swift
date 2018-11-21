
public protocol NativeConvertible {

    associatedtype NativeVariation

    var native: NativeVariation { get }
}

