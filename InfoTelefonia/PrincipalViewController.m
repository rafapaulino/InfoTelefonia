//
//  PrincipalViewController.m
//  InfoTelefonia
//
//  Created by Rafael Brigagão Paulino on 14/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()
{
    //obj utilizado para monitorar status das chamadas
    CTCallCenter *centralChamadas;
}

@end

@implementation PrincipalViewController

-(IBAction)discarNumero:(id)sender
{
    NSURL *urlNumero = [NSURL URLWithString:@"tel://9954840006"];
    [[UIApplication sharedApplication] openURL:urlNumero];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //monitorando as licacoes do usuario
    
    //recuperando as informacoes acerca da rede de telefonia do usuario
    CTTelephonyNetworkInfo *infoRede = [[CTTelephonyNetworkInfo alloc] init];
    
    //operadora
    CTCarrier *operadora = infoRede.subscriberCellularProvider;
    
    NSLog(@"Operadora:%@", operadora.description);
    
    //monitorar chamadas
    centralChamadas = [[CTCallCenter alloc] init];
    
    centralChamadas.callEventHandler = ^(CTCall *chamada){
        
        //recebendo chamada
        if ([chamada.callState isEqualToString:CTCallStateConnected]) {
            NSLog(@"Recebendo chamada");
        }
        //chamada atendida
        else if ([chamada.callState isEqualToString:CTCallStateConnected]) {
            NSLog(@"Atendeu chamada");
        }
        //desligou
        if ([chamada.callState isEqualToString:CTCallStateDisconnected]) {
            NSLog(@"Desligou chamada");
        }
        //discando
        if ([chamada.callState isEqualToString:CTCallStateDialing]) {
            NSLog(@"discando");
        }
    };
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
