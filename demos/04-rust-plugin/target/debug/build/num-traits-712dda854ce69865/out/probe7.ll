; ModuleID = 'probe7.e97035a4f649e06e-cgu.0'
source_filename = "probe7.e97035a4f649e06e-cgu.0"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; std::f64::<impl f64>::copysign
; Function Attrs: inlinehint uwtable
define internal double @"_ZN3std3f6421_$LT$impl$u20$f64$GT$8copysign17hbd5c7fbd00dccac0E"(double %self, double %sign) unnamed_addr #0 {
start:
  %0 = alloca double, align 8
  %1 = call double @llvm.copysign.f64(double %self, double %sign)
  store double %1, ptr %0, align 8
  %2 = load double, ptr %0, align 8, !noundef !1
  ret double %2
}

; probe7::probe
; Function Attrs: uwtable
define void @_ZN6probe75probe17h976f1964c7fd361dE() unnamed_addr #1 {
start:
; call std::f64::<impl f64>::copysign
  %_1 = call double @"_ZN3std3f6421_$LT$impl$u20$f64$GT$8copysign17hbd5c7fbd00dccac0E"(double 1.000000e+00, double -1.000000e+00)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.copysign.f64(double, double) #2

attributes #0 = { inlinehint uwtable "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #1 = { uwtable "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{}
