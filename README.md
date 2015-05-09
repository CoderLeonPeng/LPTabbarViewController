##LPTabbarViewController的使用
* 将`LPMainViewController`文件夹下面的所有文件添加到你的项目中
* 导入主头文件：`#import "LPMainViewController.h"`
* 创建你要管理的子控制器。
* 在`AppDelegate` 中写下面的代码。
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.

self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
UIStoryboard  *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
LPMainViewController *mainVc = [storyBoard instantiateViewControllerWithIdentifier:@"LPMainViewController"];
LPItemOneTableViewController *oneVc = [[LPItemOneTableViewController alloc] init];
LPItemTwoViewController *twoVc = [[LPItemTwoViewController alloc] init];
LPItemThreeViewController *threeVc = [[LPItemThreeViewController alloc] init];
mainVc.controllers = @[oneVc,twoVc,threeVc];
//    mainVc.animationType = AnimationTypeNone;
//    mainVc.animationType = AnimationTypeCube;
//    mainVc.animationType = AnimationTypeFade;
mainVc.animationType = AnimationTypeCustom;
mainVc.animationType = AnimationTypeMoveIn;
mainVc.animationType = AnimationTypeReveal;
mainVc.animationType = AnimationTypePageCurl;
//
mainVc.animationType = AnimationTypePageUnCurl;
mainVc.animationType = AnimationTypeSuckEffect;
//
//    mainVc.animationType = AnimationTypeRippleEffect;
//    mainVc.animationType = AnimationTypeOglFlip;



self.window.rootViewController = mainVc;

[self.window makeKeyAndVisible];

return YES;
}
```
