
import Tag

public protocol Stylable {

	@discardableResult
	func style(style: Style, tags: [Tag]) -> Self
}
