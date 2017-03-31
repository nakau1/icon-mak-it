/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

// MARK: - GoogleAPIRequestable -

/// GoogleAPIリクエストのインターフェイスプロトコル
protocol GoogleAPIRequestable {
    
    associatedtype Response
    
    /// 使用するクエリオブジェクトを返却する(必須)
    func query() -> GTLQuery
    
    /// APIからの戻り値を元にレスポンスを生成して返却する(必須)
    /// - parameter res: APIからの戻り値オブジェクト
    /// - returns: レスポンス
    func processResponse(_ res: Any?) -> Response?
    
    /// リクエスト前にクエリに対して処理(パラメータの追加など)を施す(オプショナル)
    /// - parameter query: クエリオブジェクト
    /// - returns: 引数queryに対して何らかの処理をしたクエリオブジェクト
    func processQuery(_ query: GTLQuery) -> GTLQuery?
    
    /// リクエスト前にサービスに対して処理(パラメータの追加など)を施す(オプショナル)
    /// - parameter service: サービスオブジェクト
    /// - returns: 引数serviceに対して何らかの処理をしたサービスオブジェクト
    func processService(_ service: GTLService) -> GTLService?
    
    /// API結果のステータスを返却する(オプショナル)
    ///
    /// processResponse()時に何らかのエラー等があった場合に、
    /// このメソッドでFailedを返すことで、ハンドラ側にエラーを知らせることができます
    /// - returns: API結果ステータス
    func resultState() -> GoogleAPIResultState
}

extension GoogleAPIRequestable {
    
    func processQuery(_ query: GTLQuery) -> GTLQuery? { return query }
    
    func processService(_ service: GTLService) -> GTLService? { return service }
    
    func resultState() -> GoogleAPIResultState { return .succeed }
}
