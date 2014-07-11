//
//  MWMusica.m
//  Repaso26Jun
//
//  Created by metodowhite on 26/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "MWArtist.h"

@implementation MWArtist

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dateField = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                       genre:(NSArray *)genre
                         age:(NSInteger)age
{
    self = [super init];
    if (self) {
        _name = name;
        _genre = genre;
        _age = age;
        _dateField = [[NSDate alloc] init];
    }
    return self;
}

- (NSString *)description{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"El nombre del artista de moda %@ con %ld de edad, practica los generos%@ y se creo en la fecha %@",_name,(long)_age,_genre,_dateField ];
    return descriptionString;
    
}


//
//-(NSString *)name{
//    return _name;
//}
//
//-(void)setName:(NSString *)name{
//    _name = name;
//}

@end
