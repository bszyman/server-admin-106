//
//  InformationViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "InformationViewController.h"
#import "../Views/ModuleGraphicalTabs.h"


@interface InformationViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@end

@implementation InformationViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Logs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Graphs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"File Sharing"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Server Updates"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Certificates"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Access"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
