//
//  ViewController.h
//  AppCaluculadoraBasica
//
//  Created by Guest User on 08/09/25.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property double numero1;
@property NSString *operador;
@property double numero2;
@property BOOL esNumero;

@property (weak) IBOutlet NSTextField *resultado;


- (IBAction)clean:(id)sender;
- (IBAction)igual:(id)sender;

- (IBAction)operacion:(id)sender;
- (IBAction)numeros:(id)sender;

- (IBAction)operadorUnitario:(id)sender;



@end

