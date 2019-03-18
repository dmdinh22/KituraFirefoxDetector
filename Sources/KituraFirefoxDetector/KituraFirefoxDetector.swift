
import Kitura
import Foundation

public class FirefoxDetector: RouterMiddleware {
    // swift implicitly defines access level of internal,
    // so need to expose this method to be used in other prodj
    public func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        if let userAgent = request.headers["User-Agent"], userAgent.contains("Firefox") {
            request.userInfo["usingFirefox"] = true
        }
        else {
            request.userInfo["usingFirefox"] = false
        }
        next()
    }

    public init () {
    }
}
