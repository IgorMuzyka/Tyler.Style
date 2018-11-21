
#if os(iOS) || os(tvOS) || os(macOS)

public enum StylistError: Error {

	case doesNotHandleStyle(Style)
	case stylableTypeMismatched(Any)
    case failedToExtractStylableByKeyPath(AnyKeyPath)
}

#endif
