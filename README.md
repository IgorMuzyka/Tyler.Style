# Style

[![Build Status](https://travis-ci.org/IgorMuzyka/Tyler.Style.svg?branch=master)](https://travis-ci.org/IgorMuzyka/Tyler.Style)

This repo provides a set of `Protocols` which are to be utilised when defining specific `Style` and `Stylist`  and to which any `Style` and `Stylist` should conform.

Here is excerpt from `UIViewStyle`:

```swift
public enum UIViewStyle: Style {

	case isUserInteractionEnabled(Variable<Bool>)
	case translatesAutoresizingMaskIntoConstraints(Variable<Bool>)
	case backgroundColor(Variable<Color>)
	case tintColor(Variable<Color>)
	case tintAdjustmentMode(Variable<ViewTintAdjustmentMode>)
	case isMultipleTouchEnabled(Variable<Bool>)
	case isExclusiveTouch(Variable<Bool>)
	case clipsToBounds(Variable<Bool>)
	case alpha(Variable<Number>)
	case isOpaque(Variable<Bool>)
	case clearsContextBeforeDrawing(Variable<Bool>)
	case isHidden(Variable<Bool>)
	case contentMode(Variable<ViewContentMode>)
}
```

*Notice how all the UIKit types are replaced with substitutes and wrapped in Variable type.*

The guideline for defining a **new style** is:

**Step one:** Type of a style should be an enum - this is required to keep the feeling of the DSL while using the specific style as all of the enum cases can be used without specifying the type thus ommiting the Type name(unless a compiler requires it to make sence of the context).

**Step two:** wrap any value type that your style case allows to set with **Variable**.

**Step three:** avoid any platform specific types by replacing them with substitutes.

**Step four:** extend **Stylable** with your specific **Style** Type.

```swift
extension Stylable {

    @discardableResult
    public func style(_ style: UIViewStyle, tags: [Tag] = []) -> Self {
        return self.style(style: style, tags: tags)
    }
}
```

**Step five:** implement a **Stylist** for your **Style**. Here is example of **UIViewStylist**.

```swift
open class UIViewStylist: GenericStylist {

    public static var keyPath: AnyKeyPath?

    public required init() {}

    public func style(stylable view: UIView, style: UIViewStyle, tags: [Tag], pair: VariableResolutionPair) throws {
        switch style {
        case .isUserInteractionEnabled(let value): view.isUserInteractionEnabled = try value.resolve(pair)
        case .translatesAutoresizingMaskIntoConstraints(let value): view.translatesAutoresizingMaskIntoConstraints = try value.resolve(pair)
        case .backgroundColor(let value): view.backgroundColor = try value.resolve(pair).native
        case .tintColor(let value): view.tintColor = try value.resolve(pair).native
        case .tintAdjustmentMode(let value): view.tintAdjustmentMode = try value.resolve(pair).native!
        case .isMultipleTouchEnabled(let value): view.isMultipleTouchEnabled = try value.resolve(pair)
        case .isExclusiveTouch(let value): view.isExclusiveTouch = try value.resolve(pair)
        case .clipsToBounds(let value): view.clipsToBounds = try value.resolve(pair)
        case .alpha(let value): view.alpha = try value.resolve(pair).native
        case .isOpaque(let value): view.isOpaque = try value.resolve(pair)
        case .clearsContextBeforeDrawing(let value): view.clearsContextBeforeDrawing = try value.resolve(pair)
        case .isHidden(let value): view.isHidden = try value.resolve(pair)
        case .contentMode(let value): view.contentMode = try value.resolve(pair).native!
        }
    }
}

```

Notice how we **resolve** value from **VariableResolutionPair** and sometimes call **native** value of the result. This is due to the fact that we wrapped value with **Variable** type and we can get it from few places and whenever we had a substitute type we would want to convert it back to native type by calling native.