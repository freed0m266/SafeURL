import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. 
// Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(URLMacros)
import URLMacros

let testMacros: [String: Macro.Type] = [
	"URL": URLMacro.self // #URL should use URLMacro
]
#endif

final class URLTests: XCTestCase {
	func testValidURL() {
		#if canImport(URLMacros)
		assertMacroExpansion(
			#"""
			#URL("https://www.avanderlee.com")
			"""#,
			expandedSource: #"""
			URL(string: "https://www.avanderlee.com")!
			"""#,
			macros: testMacros
		)
		#else
		throw XCTSkip("macros are only supported when running tests for the host platform")
		#endif
	}
}
