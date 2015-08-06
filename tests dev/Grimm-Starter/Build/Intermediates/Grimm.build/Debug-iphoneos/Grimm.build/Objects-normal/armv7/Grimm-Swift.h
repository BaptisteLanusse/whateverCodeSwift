// Generated by Apple Swift version 2.0 (swiftlang-700.0.45 clang-700.0.57.2)
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
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSNotification;

SWIFT_CLASS("_TtC5Grimm11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)themeDidChange:(NSNotification * __null_unspecified)notification;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UISegmentedControl;
@class UIScrollView;
@class UIPageControl;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC5Grimm17OptionsController")
@interface OptionsController : UIViewController <UIScrollViewDelegate>
@property (nonatomic) NSInteger currentPage;
@property (nonatomic, weak) IBOutlet UISegmentedControl * __null_unspecified readingModeSegmentedControl;
@property (nonatomic, weak) IBOutlet UIScrollView * __null_unspecified scrollView;
@property (nonatomic, weak) IBOutlet UISegmentedControl * __null_unspecified titleAlignmentSegmentedControl;
@property (nonatomic, weak) IBOutlet UIPageControl * __null_unspecified pageControl;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (IBAction)pageControlPageDidChange:(id __nonnull)_;
- (IBAction)readingModeDidChange:(UISegmentedControl * __null_unspecified)segmentedControl;
- (IBAction)titleAlignmentDidChange:(UISegmentedControl * __null_unspecified)segmentedControl;
- (void)scrollViewDidScroll:(UIScrollView * __nonnull)scrollView;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Grimm9StoryCell")
@interface StoryCell : UITableViewCell
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * __null_unspecified)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (void)reloadTheme;
@end

@class UIStoryboardSegue;
@class UITableView;
@class NSIndexPath;

SWIFT_CLASS("_TtC5Grimm19StoryListController")
@interface StoryListController : UITableViewController
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __null_unspecified)sender;
- (void)viewDidLoad;
- (void)preferredContentSizeCategoryDidChange:(NSNotification * __null_unspecified)notification;
- (void)themeDidChange:(NSNotification * __null_unspecified)notification;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)tableView:(UITableView * __nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)reloadTheme;
@end


SWIFT_CLASS("_TtC5Grimm9StoryView")
@interface StoryView : UIView
- (void)awakeFromNib;
- (void)reloadTheme;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImageView;
@protocol UIViewControllerTransitionCoordinator;
@class NSLayoutConstraint;

SWIFT_CLASS("_TtC5Grimm19StoryViewController")
@interface StoryViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIScrollView * __null_unspecified scrollView;
@property (nonatomic, weak) IBOutlet StoryView * __null_unspecified storyView;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified optionsContainerView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint * __null_unspecified optionsContainerViewBottomConstraint;
@property (nonatomic) BOOL showingOptions;
@property (nonatomic) UIImageView * __nonnull blurView;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator> __nonnull)coordinator;
- (void)viewWillAppear:(BOOL)animated;
- (IBAction)optionsButtonTapped:(id __nonnull)_;
- (void)updateBlur;
- (void)themeDidChange:(NSNotification * __null_unspecified)notification;
- (void)reloadTheme;
@end


SWIFT_CLASS("_TtC5Grimm26ThemedNavigationController")
@interface ThemedNavigationController : UINavigationController
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (void)reloadTheme;
- (void)themeDidChange:(NSNotification * __null_unspecified)notification;
@end


@interface UIColor (SWIFT_EXTENSION(Grimm))
- (UIColor * __nonnull)colorForTranslucency;
+ (UIColor * __nonnull)rgba:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor * __nonnull)defaultSeparatorColor;
+ (UIColor * __nonnull)nightTimeTextBackgroundColor;
+ (UIColor * __nonnull)nightTimeTextColor;
+ (UIColor * __nonnull)nightTimeTintColor;
@end

#pragma clang diagnostic pop