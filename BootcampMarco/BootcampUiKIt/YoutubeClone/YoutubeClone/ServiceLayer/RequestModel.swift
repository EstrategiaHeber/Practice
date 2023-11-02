//
//  RequestModel.swift
//  YoutubeClone
//
//  Created by HEBER JIMENEZ on 23/10/23.
//

import Foundation

struct RequestModel  {
    
    let endpoint : Endpoints
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .youtube
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod : String{
        case GET
        case POST
    }
    
    // Diferentes endPoints a los que se se hacen llamado
    enum Endpoints : String   {
        case search = "/search"
        case channels = "/channels"
        case playlist = "/playlists"
        case playlistItems = "/playlistItems"
        case videos = "/videos"
        case empty = ""
    }

    enum URLBase : String{
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://othereweb.com/v2"
    }
}
