//
//  ViewController.m
//  AppCaluculadoraBasica
//
//  Created by Guest User on 08/09/25.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.esNumero = NO;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (IBAction)memoriaAdd:(id)sender {
    self.memoria += [self.resultado.stringValue doubleValue];
}

- (IBAction)memoriaRecall:(id)sender {
    self.resultado.stringValue = [NSString stringWithFormat:@"%g", self.memoria];
    self.esNumero = NO;
}

- (IBAction)memoriaStore:(id)sender {
    self.memoria = [self.resultado.stringValue doubleValue];
}

- (IBAction)operadorUnitario:(id)sender {
    double valor = [self.resultado.stringValue doubleValue];
    double resul = 0;
    NSButton *boton = (NSButton *)sender;
    self.opUnitario = boton.title;
    
    if([self.opUnitario isEqualToString:@"1/x"]){
        if(valor == 0){
            self.resultado.stringValue = @"Error";
            return;
        }
        resul = 1.0 / valor;
    } else if([self.opUnitario isEqualToString:@"sqrt"]){
        if(valor < 0){
            self.resultado.stringValue = @"Error";
            return;
        }
        resul = sqrt(valor);
    } else if([self.opUnitario isEqualToString:@"sin"]){
        double radianes = valor * M_PI / 180;
        resul = sin(radianes);
    } else if ([self.opUnitario isEqualToString:@"cos"]){
        double radianes = valor * M_PI / 180;
        resul = cos(radianes);
    }
    
    self.resultado.stringValue = [NSString stringWithFormat:@"%g", resul];
    self.esNumero = NO;
}

- (IBAction)numeros:(id)sender {
    //NSString *numero = sender.
    NSButton *boton = (NSButton *)sender;
    NSString *numero = boton.title;
    
    if([numero isEqualToString:@"."]){
        if([self.resultado.stringValue containsString:@"."]){
            return;
        }
        if(!self.esNumero){
            self.resultado.stringValue = @"0.";
            self.esNumero = YES;
            return;
        }
    }
    
    if(self.esNumero){
        self.resultado.stringValue = [self.resultado.stringValue stringByAppendingString:numero];
    } else {
        self.resultado.stringValue = numero;
        self.esNumero = YES;
    }
}

- (IBAction)operacion:(id)sender {
    // Extraemos el primer operando
    self.numero1 = [self.resultado.stringValue doubleValue];
    
    // Extraemos el operador
    NSButton *boton = (NSButton *)sender;
    self.operador = boton.title;
    
    // Preparamos para leer el segundo numero (operando)
    self.esNumero = NO;
}

- (IBAction)igual:(id)sender {
    // Extraemos el segundo operando
    self.numero2 = [self.resultado.stringValue doubleValue];
    double resul = 0;
    
    if([self.operador isEqualToString:@"+"]){
        resul = self.numero1 + self.numero2;
    } else if([self.operador isEqualToString:@"-"]){
        resul = self.numero1 - self.numero2;
    } else if([self.operador isEqualToString:@"/"]){
        resul = self.numero1 / self.numero2;
    } else if([self.operador isEqualToString:@"x"]){
        resul = self.numero1 * self.numero2;
    }
    
    self.resultado.stringValue = [NSString stringWithFormat:@"%g", resul];
    self.esNumero = NO;
    
}

- (IBAction)clean:(id)sender {
    self.resultado.stringValue = @"0";
    self.numero1 = 0;
    self.numero2 = 0;
    self.memoria = 0;
    self.esNumero = NO;
    self.operador = @"";
}
@end
