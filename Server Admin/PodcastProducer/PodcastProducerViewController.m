//
//  PodcastProducerViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "PodcastProducerViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "PodcastProducerOverviewViewController.h"
#import "PodcastProducerLogsViewController.h"
#import "PodcastProducerCamerasViewController.h"
#import "PodcastProducerWorkflowsViewController.h"
#import "PodcastProducerSettingsViewController.h"


@interface PodcastProducerViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation PodcastProducerViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"PodcastProducerNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Logs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Cameras"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Workflows"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"PodcastProducerNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[PodcastProducerOverviewViewController alloc] initWithNibName:@"PodcastProducerOverviewViewController"
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
            NSViewController *vc = [[PodcastProducerLogsViewController alloc] initWithNibName:@"PodcastProducerLogsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"logs"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Cameras"]) {
        if ([self.panels objectForKey:@"cameras"]) {
            NSViewController *vc = [self.panels objectForKey:@"cameras"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PodcastProducerCamerasViewController alloc] initWithNibName:@"PodcastProducerCamerasViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"cameras"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Workflows"]) {
        if ([self.panels objectForKey:@"workflows"]) {
            NSViewController *vc = [self.panels objectForKey:@"workflows"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PodcastProducerWorkflowsViewController alloc] initWithNibName:@"PodcastProducerSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"workflows"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PodcastProducerSettingsViewController alloc] initWithNibName:@"PodcastProducerSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[PodcastProducerOverviewViewController alloc] initWithNibName:@"PodcastProducerOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
