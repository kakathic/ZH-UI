.class Lcom/android/systemui/globalactions/MiuiGlobalActions$2;
.super Ljava/lang/Object;
.source "MiuiGlobalActions.java"

# interfaces
.implements Lcom/miui/maml/ScreenElementRoot$OnExternCommandListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/globalactions/MiuiGlobalActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;


# direct methods
.method public static synthetic $r8$lambda$IfBiN8CXmsJSHOFNDhbtjqasqL0(Lcom/android/systemui/globalactions/MiuiGlobalActions$2;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->lambda$onCommand$0()V

    return-void
.end method

.method public static synthetic $r8$lambda$xLIdCJfY33HzHz6y1APd3MNd9h0(Lcom/android/systemui/globalactions/MiuiGlobalActions$2;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->lambda$onCommand$1()V

    return-void
.end method

.method constructor <init>(Lcom/android/systemui/globalactions/MiuiGlobalActions;)V
    .registers 2

    iput-object p1, p0, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onCommand$0()V
    .registers 1

    iget-object p0, p0, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;

    invoke-static {p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions;->access$600(Lcom/android/systemui/globalactions/MiuiGlobalActions;)V

    return-void
.end method

.method private synthetic lambda$onCommand$1()V
    .registers 1

    iget-object p0, p0, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;

    invoke-virtual {p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions;->toggleSlientMode()V

    return-void
.end method


# virtual methods
.method public onCommand(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;)V
    .registers 4

    const-string p2, "airplane"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_17

    iget-object p1, p0, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;

    invoke-static {p1}, Lcom/android/systemui/globalactions/MiuiGlobalActions;->access$200(Lcom/android/systemui/globalactions/MiuiGlobalActions;)Ljava/util/concurrent/Executor;

    move-result-object p1

    new-instance p2, Lcom/android/systemui/globalactions/MiuiGlobalActions$2$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions$2$$ExternalSyntheticLambda0;-><init>(Lcom/android/systemui/globalactions/MiuiGlobalActions$2;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_86

    :cond_17
    const-string/jumbo p2, "silent"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2f

    iget-object p1, p0, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;

    invoke-static {p1}, Lcom/android/systemui/globalactions/MiuiGlobalActions;->access$200(Lcom/android/systemui/globalactions/MiuiGlobalActions;)Ljava/util/concurrent/Executor;

    move-result-object p1

    new-instance p2, Lcom/android/systemui/globalactions/MiuiGlobalActions$2$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions$2$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/globalactions/MiuiGlobalActions$2;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_86

    :cond_2f
    const-string p2, "reboot"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_3a

    const/4 p1, 0x0

    goto :goto_4b

    :cond_3a
    const-string p2, "recovery"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_43

    goto :goto_4b

    :cond_43
    const-string p2, "bootloader"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_53

    :goto_4b
    :try_start_4b
    invoke-static {}, Lcom/android/systemui/globalactions/MiuiGlobalActions;->access$300()Landroid/os/IPowerManager;

    move-result-object p0

    invoke-interface {p0, p3, p1, p3}, Landroid/os/IPowerManager;->reboot(ZLjava/lang/String;Z)V
    :try_end_52
    .catch Landroid/os/RemoteException; {:try_start_4b .. :try_end_52} :catch_86

    goto :goto_86

    :cond_53
    const-string/jumbo p2, "shutdown"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_67

    new-instance p1, Lcom/android/systemui/globalactions/MiuiGlobalActions$2$1;

    const-string p2, "ShutdownThread"

    invoke-direct {p1, p0, p2}, Lcom/android/systemui/globalactions/MiuiGlobalActions$2$1;-><init>(Lcom/android/systemui/globalactions/MiuiGlobalActions$2;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_86

    :cond_67
    const-string p2, "dismiss"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_79

    iget-object p0, p0, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;

    invoke-static {p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions;->access$400(Lcom/android/systemui/globalactions/MiuiGlobalActions;)Landroid/os/Handler;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_86

    :cond_79
    const-string p2, "launch_updater"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_86

    iget-object p0, p0, Lcom/android/systemui/globalactions/MiuiGlobalActions$2;->this$0:Lcom/android/systemui/globalactions/MiuiGlobalActions;

    invoke-static {p0}, Lcom/android/systemui/globalactions/MiuiGlobalActions;->access$500(Lcom/android/systemui/globalactions/MiuiGlobalActions;)V

    :catch_86
    :cond_86
    :goto_86
    return-void
.end method
