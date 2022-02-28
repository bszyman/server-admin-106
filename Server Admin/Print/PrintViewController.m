//
//  PrintViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "PrintViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "PrintOverviewViewController.h"
#import "PrintLogsViewController.h"
#import "PrintJobStatusViewController.h"
#import "PrintQueuesViewController.h"
#import "PrintSettingsViewController.h"


@interface PrintViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation PrintViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"PrintNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Logs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Job Status"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Queues"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"PrintNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[PrintOverviewViewController alloc] initWithNibName:@"PrintOverviewViewController"
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
            NSViewController *vc = [[PrintLogsViewController alloc] initWithNibName:@"PrintLogsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"logs"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Job Status"]) {
        if ([self.panels objectForKey:@"jobstatus"]) {
            NSViewController *vc = [self.panels objectForKey:@"jobstatus"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PrintJobStatusViewController alloc] initWithNibName:@"PrintJobStatusViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"jobstatus"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Queues"]) {
        if ([self.panels objectForKey:@"queues"]) {
            NSViewController *vc = [self.panels objectForKey:@"queues"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PrintQueuesViewController alloc] initWithNibName:@"PrintQueuesViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"queues"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PrintSettingsViewController alloc] initWithNibName:@"PrintSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PrintOverviewViewController alloc] initWithNibName:@"PrintOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
