//
//  Constants.swift
//  TwitterClone
//
//  Created by 김수빈 on 2022/01/28.
//

import Firebase

// 이미지 스토리지
let STORAGE_URL = "gs://twitterclone-5d55a.appspot.com"
let STORAGE_REF = Storage.storage().reference(forURL: STORAGE_URL)
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_image")

// 디비 정보
let DB_URL = "https://twitterclone-5d55a-default-rtdb.firebaseio.com"
let DB_REF = Database.database(url: DB_URL).reference()
let REF_USERS = DB_REF.child("user")
