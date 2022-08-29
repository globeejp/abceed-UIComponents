import Foundation

public struct Abceed<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has abceed extensions.
public protocol AbceedCompatible {
    /// Extended type
    /// - Note: 名前が `CompatibleType` だと、他の同名associatedtypeとコンフリクトするリスクがある
    associatedtype AbceedCompatibleType

    /// Abceed extensions.
    static var abc: Abceed<AbceedCompatibleType>.Type { get set }

    /// Abceed extensions.
    var abc: Abceed<AbceedCompatibleType> { get set }
}

extension AbceedCompatible {
    /// Abceed extensions.
    public static var abc: Abceed<Self>.Type {
        get {
            return Abceed<Self>.self
        }
        set {
            // this enables using Abceed to "mutate" base type
        }
    }

    /// Abceed extensions.
    public var abc: Abceed<Self> {
        get {
            return Abceed(self)
        }
        set {
            // this enables using Abceed to "mutate" base object
        }
    }
}

/// Extend NSObject with `abceed` proxy.
extension NSObject: AbceedCompatible {}
