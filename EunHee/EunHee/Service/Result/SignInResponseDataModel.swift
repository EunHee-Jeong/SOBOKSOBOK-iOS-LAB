//
//  SignInResponseDataModel.swift
//  EunHee
//
//  Created by 정은희 on 2022/01/08.
//

import Foundation

// MARK: - SignInResponseData
struct SignInResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignInResultData? // 응답 바디가 성공일 경우에만 존재하기 때문에 Optional로 선언
}

// MARK: - SignInResultData
struct SignInResultData: Codable {
    let id: Int
    let name, email: String
}
