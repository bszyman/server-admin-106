//
//  DhcpViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "DhcpViewController.h"
#import "../Views/ModuleGraphicalTabs.h"


@interface DhcpViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@end

@implementation DhcpViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Log"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Clients"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Subnets"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Static Maps"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
