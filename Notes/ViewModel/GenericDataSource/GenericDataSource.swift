//
//  GenericDataSource.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 11/10/2021.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
