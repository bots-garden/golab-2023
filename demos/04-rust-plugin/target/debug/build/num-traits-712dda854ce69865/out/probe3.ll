; ModuleID = 'probe3.52ae27a99f30738f-cgu.0'
source_filename = "probe3.52ae27a99f30738f-cgu.0"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; probe3::probe
; Function Attrs: uwtable
define void @_ZN6probe35probe17h81c6c4a44191aecbE() unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  store i32 -2147483648, ptr %0, align 4
  %1 = load i32, ptr %0, align 4, !noundef !1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.bitreverse.i32(i32) #1

attributes #0 = { uwtable "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{}
