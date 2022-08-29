import Foundation

public struct Book: Codable {
    public var author: String
    public var id_book: String
    public var img_url: String
    public var name_book: String
    public var publisher: String

    public init(author: String, id_book: String, img_url: String, name_book: String, publisher: String) {
        self.author = author
        self.id_book = id_book
        self.img_url = img_url
        self.name_book = name_book
        self.publisher = publisher
    }
}
