//
//  PushNotificationViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "PushNotificationViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "PushNotificationOverviewViewController.h"
#import "PushNotificationLogsViewController.h"


@interface PushNotificationViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation PushNotificationViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"PushNotificationNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Logs"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"PushNotificationNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[PushNotificationOverviewViewController alloc] initWithNibName:@"PushNotificationOverviewViewController"
                                                                           bundle:[NSBundle mainBundle]];
        
        [self setActivePanel:vc];
        [self.panels setObject:vc forKey:@"overview"];
        
        [self.panelView addSubview:vc.view];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}

- (void)clearAllSubviews
{
    NSArray *subviews = self.panelView.subviews;
    for (NSView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

- (void)changeModuleSubnavigation:(NSNotification *)n
{
    NSString *tabTitle = [n.userInfo objectForKey:@"tabTitle"];
    
    [self clearAllSubviews];
    
    if ([tabTitle isEqualToString:@"Logs"]) {
        if ([self.panels objectForKey:@"logs"]) {
            NSViewController *vc = [self.panels objectForKey:@"logs"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PushNotificationLogsViewController alloc] initWithNibName:@"PushNotificationLogsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"logs"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PushNotificationOverviewViewController alloc] initWithNibName:@"PushNotificationOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
