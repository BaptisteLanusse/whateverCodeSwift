// Generated by Apple Swift version 1.2 (swiftlang-602.0.53.1 clang-602.0.53)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
#if __has_feature(nullability)
#  define SWIFT_NULLABILITY(X) X
#else
# if !defined(__nonnull)
#  define __nonnull
# endif
# if !defined(__nullable)
#  define __nullable
# endif
# if !defined(__null_unspecified)
#  define __null_unspecified
# endif
#  define SWIFT_NULLABILITY(X)
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC7DrawPad11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UISlider;
@class UIImageView;
@class UILabel;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC7DrawPad22SettingsViewController")
@interface SettingsViewController : UIViewController
@property (nonatomic) CGFloat brush;
@property (nonatomic) CGFloat opacity;
@property (nonatomic) CGFloat red;
@property (nonatomic) CGFloat green;
@property (nonatomic) CGFloat blue;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified sliderBrush;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified sliderOpacity;
@property (nonatomic, weak) IBOutlet UIImageView * __null_unspecified imageViewBrush;
@property (nonatomic, weak) IBOutlet UIImageView * __null_unspecified imageViewOpacity;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified labelBrush;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified labelOpacity;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified sliderRed;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified sliderGreen;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified sliderBlue;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified labelRed;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified labelGreen;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified labelBlue;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (IBAction)close:(id __nonnull)sender;
- (IBAction)colorChanged:(UISlider * __nonnull)sender;
- (IBAction)sliderChanged:(UISlider * __nonnull)sender;
- (void)drawPreview;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIEvent;
@class UIStoryboardSegue;

SWIFT_CLASS("_TtC7DrawPad14ViewController")
@interface ViewController : UIViewController
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) CGFloat red;
@property (nonatomic) CGFloat green;
@property (nonatomic) CGFloat blue;
@property (nonatomic) CGFloat brushWidth;
@property (nonatomic) CGFloat opacity;
@property (nonatomic) BOOL swiped;
@property (nonatomic, weak) IBOutlet UIImageView * __null_unspecified mainImageView;
@property (nonatomic, weak) IBOutlet UIImageView * __null_unspecified tempImageView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)touchesBegan:(NSSet * __nonnull)touches withEvent:(UIEvent * __nullable)event;
- (void)drawLineFrom:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;
- (void)touchesMoved:(NSSet * __nonnull)touches withEvent:(UIEvent * __nonnull)event;
- (void)touchesEnded:(NSSet * __nonnull)touches withEvent:(UIEvent * __nonnull)event;
- (IBAction)reset:(id __nonnull)sender;
- (IBAction)share:(id __nonnull)sender;
- (IBAction)pencilPressed:(id __nonnull)sender;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface ViewController (SWIFT_EXTENSION(DrawPad))
- (void)settingsViewControllerFinished:(SettingsViewController * __nonnull)settingsViewController;
@end

#pragma clang diagnostic pop
