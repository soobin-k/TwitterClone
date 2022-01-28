//
//  AuthService.swift
//  TwitterClone
//
//  Created by 김수빈 on 2022/01/29.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    // 공유 인스턴스 생성
    static let shared = AuthService()
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void){
        let email = credentials.email
        let password = credentials.password
        let username = credentials.username
        let fullname = credentials.fullname
        
        // 이미지 압축
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        // 스토리지 참조
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        // 이미지를 파이어베이스 스토리지에 등록 -> 나중에 이미지 url을 DB에 저장해야함
        storageRef.putData(imageData, metadata: nil){ (metaData, error) in
            storageRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                if let error = error {
                    // 이미지 등록 오류 메시지
                    print("DEBUG: Error is \(error.localizedDescription)")
                    return
                }
                
                // 파이어베이스 사용자 등록
                Auth.auth().createUser(withEmail: email, password: password){
                    (result, error) in
                    if let error = error {
                        // 사용자 등록 오류 메시지
                        print("DEBUG: Error is \(error.localizedDescription)")
                        return
                    }
                    
                    // 유저 식별자
                    guard let uid = result?.user.uid else { return }
                    
                    // 값은 딕셔너리 타입으로 생성해야함.
                    let values = ["email" : email, "username": username, "fulllname": fullname, "profileImageUrl": profileImageUrl]
                    
                    // 값 업데이트
                    // ✨ 이때 completion을 통해 해당 코드가 완료됨을 호출하는 함수에 알려줌
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                    
                }
            }
        }
    }
}
