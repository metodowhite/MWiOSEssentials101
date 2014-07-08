//
//  MWMusica.h
//  Repaso26Jun
//
//  Created by metodowhite on 26/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWArtist : NSObject

@property (strong,nonatomic) NSString *name;

@property (strong, nonatomic, readonly) NSDate *dateField;

@property (strong, nonatomic) NSArray *genre;

@property (nonatomic) NSInteger age;


- (instancetype)initWithName:(NSString *)name
                       genre:(NSArray *)genre
                         age:(NSInteger)age;
//{

- (NSString *)description;


//    NSString *_name;
//}
//
//-(NSString *)name;
//-(void)setName:(NSString *)name;




@end
