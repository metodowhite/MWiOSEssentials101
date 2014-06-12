//
//  MWView.m
//  TouchTracker
//
//  Created by metodowhite on 10/06/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "MWDrawView.h"
#import "MWLine.h"

@interface MWDrawView()

@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
//array = tipo de dato que permite alamacenar una lista de refenrencias a (punteros) objetos consultables por índice, no se pueden hacer arrays de datos primitivos (enteros, o flotantes) para convertir un entero en un objeto ponemos @1, así convertimos un entero en un NSNumber
//dicionario = almacena pares de objetos "key:value" consultables por Key. un diccionario jamás te garantiza el orden de sus elementos


//el array es muy útil para almacenar elementos secuenciales o que no tienen relación entre ellos de valor, y dicionario para almacenar donde la relación de valor entre los elementos es relevante.

//para almacenar elementos en un array necesito que sean creados de manera secuencial, uno detrás de otros. no así en los diccionarios.

//una mano funciona de manera no secuencial, por loq ue para almacenar touches no me sirve un array, debo usar un diccionario.


@property (nonatomic, weak) MWLine *selectedLine;

@end

@implementation MWDrawView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        //2
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init]; //[NSMutableArray new];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        [doubleTapRecognizer setNumberOfTapsRequired:2];
        [doubleTapRecognizer setDelaysTouchesBegan:YES];
        [self addGestureRecognizer:doubleTapRecognizer];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [tapRecognizer setDelaysTouchesBegan:YES];
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        [self addGestureRecognizer:tapRecognizer];
        
    }
    return self;
}


-(void)doubleTap:(UIGestureRecognizer *)gr{
    NSLog(@"doble tap!!");
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    
    [self setNeedsDisplay];
}


-(void)tap:(UIGestureRecognizer *)gr{
    NSLog(@"tap!!");
    CGPoint point = [gr locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    
    [self setNeedsDisplay];
}



- (void)strokeLine:(MWLine *)line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] set];
    for (MWLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }
    
    if (self.selectedLine) {
        [[UIColor greenColor]set];
        [self strokeLine:self.selectedLine];
    }
}

-(MWLine *)lineAtPoint:(CGPoint)p{
    for (MWLine *l in self.finishedLines) {
        //analizo el punto(x,y) de inicio y final de una línea (cada líena del array de líneas terminadas)
        CGPoint start = l.begin;
        CGPoint end = l.end;
        
        for (float t = 0.0; t < 1.0; t+=0.05) {//este loop da 20 vueltas (de 0 a 1)
            //esto genera un area sensible de "20" al rededor de mi línea (si esta es 1)
            float x = start.x + t * (end.x - start.x);
            float y = start.y + t * (end.y - start.y);
            
            if(hypot(x - p.x, y - p.y) < 20.0){ // si la hypotenusa que genera el angulo recto mi dedo y la línea es menor a 20, considero que estoy tocando la línea, y me devuelve esa línea
                return l;
            }
        }
    }
    return nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        MWLine *line = [[MWLine alloc] init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];//no almacenamos el valor del touch, solo su nombre, para poder eliminarlo depues y borrarlo de memoria

        self.linesInProgress[key] = line;
    }
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        MWLine *line = self.linesInProgress[key];
        
        line.end = [t locationInView:self];
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        MWLine *line = self.linesInProgress[key];
        
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
        
        [self setNeedsDisplay];
    }
}

//2
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
}

@end



























