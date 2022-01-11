//
//  NetworkResult.swift
//  EunHee
//
//  Created by 정은희 on 2022/01/08.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
