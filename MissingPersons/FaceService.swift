//
//  FaceService.swift
//  MissingPersons
//
//  Created by Mark Price on 4/20/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

import Foundation
import ProjectOxfordFace

class FaceService {
    static let instance = FaceService()
    
    let client = MPOFaceServiceClient(subscriptionKey: "7558c72e87064b8a831cbd2edb44c206")
}
