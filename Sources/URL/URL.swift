/// A macro that produces an unwrapped URL in case of a valid input URL.
/// For example,
///
///     #URL("https://www.apple.com")
///
/// produces an unwrapped `URL` if the URL is valid. Otherwise, it emits a compile-time error.

import Foundation

@freestanding(expression)
public macro URL(_ stringLiteral: String) -> URL = #externalMacro(module: "URLMacros", type: "URLMacro")
