//
//  UserSignInService.swift
//  EunHee
//
//  Created by 정은희 on 2022/01/08.
//

import Foundation

import Alamofire

struct UserSignInService {
    static let shared = UserSignInService()
    
    // MARK: - View Life Cycle
    func signIn(email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)) { // 탈출 클로저 사용해서 함수가 리턴 되더라도 서버 작업이 완료될 때 전달 받을 수 있게 해줌.
        
        let url = APIConstants.loginURL // 1️⃣ 통신할 API 주소
        let header: HTTPHeaders = [ // 2️⃣ 요청 헤더
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [    // 3️⃣ 요청 바디
            "email": email,
            "password" : password
        ]
        
        // ✅ 요청서(dataRequest) 작성
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        // ✅ 요청서에 responseData 함수 호출 -> 데이터 통신 시작
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeSignInStatus(by: statusCode, value)   // judgeSignInStatus로 networkResult에 정제된 결과를 받아와서,
                completion(networkResult)   // completion에 넣어줌
            case .failure(let err):
                print(err)  // 오류메시지 전달
                completion(.networkFail)    // networkFail 반환.
            }
        }
    }
    
    // ✅ 성공 시 처리해주는 부분 (원하는 데이터를 받지 못하는 경우 고려해 분기 처리)
    private func judgeSignInStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidLoginData(data: data)   // 성공
        case 400: return .pathErr   // 클라이언트 오류
        case 500: return .serverErr // 서버 오류
        default: return .networkFail
        }
    }
    
    // ✅ 데이터가 맞게 들어왔을 때 처리(가공)해주는 함수
    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignInResponseData.self, from: data) else {return .pathErr}
        return .success(decodedData)
    }
}
