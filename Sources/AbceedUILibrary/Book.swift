import Foundation

public struct Book: Codable {
    public var author: String
    public var id_book: String
    public var img_url: String
    public var name_book: String
    public var publisher: String
}

extension Book {
    public static func kinfure() -> Book {
        Book(
            author: "TEX 加藤",
            id_book: "tokyu_kinhure_new",
            img_url: "https://d3grtcc7imzgqe.cloudfront.net/img/book_small/tokyu_kinhure_new.jpg",
            name_book: "TOEIC L&R TEST 出る単特急 金のフレーズ",
            publisher: "朝日新聞出版"
        )
    }
}
