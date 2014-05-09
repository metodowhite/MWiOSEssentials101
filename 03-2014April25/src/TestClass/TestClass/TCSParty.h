//
//  TCSParty.h
//  TestClass
//
//  Created by metodowhite on 25/04/14.
//  Copyright (c) 2014 elkraneoteach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCSParty : NSObject

@property (nonatomic, strong) NSNumber *precio;

- (void)crearFiestaConPrecio:(NSNumber *)precio;

@end
