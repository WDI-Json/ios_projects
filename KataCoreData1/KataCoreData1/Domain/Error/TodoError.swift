//
//  TodoError.swift
//  KataCoreData1
//
//  Created by Wouter on 12/06/2022.
//

import Foundation

enum TodoError: Error{
 case DataSourceError, CreateError, DeleteError, UpdateError, FetchError
}
