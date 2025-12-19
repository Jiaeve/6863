; ModuleID = 'kfifo.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.kfifo = type { i8*, i32, i32, i32 }

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"out1 == a\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"kfifo_klee_driver.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"out2 == b\00", align 1
@.str.5 = private unnamed_addr constant [54 x i8] c"/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.6 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.7 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @kfifo_init(%struct.kfifo* %fifo, i8* %buffer, i32 %size) #0 !dbg !13 {
entry:
  %fifo.addr = alloca %struct.kfifo*, align 8
  %buffer.addr = alloca i8*, align 8
  %size.addr = alloca i32, align 4
  store %struct.kfifo* %fifo, %struct.kfifo** %fifo.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kfifo** %fifo.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i8* %buffer, i8** %buffer.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buffer.addr, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i8*, i8** %buffer.addr, align 8, !dbg !33
  %1 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !34
  %buffer1 = getelementptr inbounds %struct.kfifo, %struct.kfifo* %1, i32 0, i32 0, !dbg !35
  store i8* %0, i8** %buffer1, align 8, !dbg !36
  %2 = load i32, i32* %size.addr, align 4, !dbg !37
  %3 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !38
  %size2 = getelementptr inbounds %struct.kfifo, %struct.kfifo* %3, i32 0, i32 1, !dbg !39
  store i32 %2, i32* %size2, align 8, !dbg !40
  %4 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !41
  %in = getelementptr inbounds %struct.kfifo, %struct.kfifo* %4, i32 0, i32 2, !dbg !42
  store i32 0, i32* %in, align 4, !dbg !43
  %5 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !44
  %out = getelementptr inbounds %struct.kfifo, %struct.kfifo* %5, i32 0, i32 3, !dbg !45
  store i32 0, i32* %out, align 8, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @kfifo_len(%struct.kfifo* %fifo) #0 !dbg !48 {
entry:
  %fifo.addr = alloca %struct.kfifo*, align 8
  store %struct.kfifo* %fifo, %struct.kfifo** %fifo.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kfifo** %fifo.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !53
  %in = getelementptr inbounds %struct.kfifo, %struct.kfifo* %0, i32 0, i32 2, !dbg !54
  %1 = load i32, i32* %in, align 4, !dbg !54
  %2 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !55
  %out = getelementptr inbounds %struct.kfifo, %struct.kfifo* %2, i32 0, i32 3, !dbg !56
  %3 = load i32, i32* %out, align 8, !dbg !56
  %sub = sub i32 %1, %3, !dbg !57
  ret i32 %sub, !dbg !58
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @kfifo_put(%struct.kfifo* %fifo, i8* %buf, i32 %len) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %fifo.addr = alloca %struct.kfifo*, align 8
  %buf.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.kfifo* %fifo, %struct.kfifo** %fifo.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kfifo** %fifo.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !70
  %call = call i32 @kfifo_len(%struct.kfifo* %0), !dbg !72
  %1 = load i32, i32* %len.addr, align 4, !dbg !73
  %add = add i32 %call, %1, !dbg !74
  %2 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !75
  %size = getelementptr inbounds %struct.kfifo, %struct.kfifo* %2, i32 0, i32 1, !dbg !76
  %3 = load i32, i32* %size, align 8, !dbg !76
  %cmp = icmp ugt i32 %add, %3, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !79
  br label %return, !dbg !79

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i32 0, i32* %i, align 4, !dbg !82
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !84
  %5 = load i32, i32* %len.addr, align 4, !dbg !86
  %cmp1 = icmp ult i32 %4, %5, !dbg !87
  br i1 %cmp1, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %buf.addr, align 8, !dbg !89
  %7 = load i32, i32* %i, align 4, !dbg !91
  %idxprom = zext i32 %7 to i64, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %idxprom, !dbg !89
  %8 = load i8, i8* %arrayidx, align 1, !dbg !89
  %9 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !92
  %buffer = getelementptr inbounds %struct.kfifo, %struct.kfifo* %9, i32 0, i32 0, !dbg !93
  %10 = load i8*, i8** %buffer, align 8, !dbg !93
  %11 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !94
  %in = getelementptr inbounds %struct.kfifo, %struct.kfifo* %11, i32 0, i32 2, !dbg !95
  %12 = load i32, i32* %in, align 4, !dbg !95
  %13 = load i32, i32* %i, align 4, !dbg !96
  %add2 = add i32 %12, %13, !dbg !97
  %14 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !98
  %size3 = getelementptr inbounds %struct.kfifo, %struct.kfifo* %14, i32 0, i32 1, !dbg !99
  %15 = load i32, i32* %size3, align 8, !dbg !99
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !100
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !100
  %rem = urem i32 %add2, %15, !dbg !100, !klee.check.div !101
  %idxprom4 = zext i32 %rem to i64, !dbg !92
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %idxprom4, !dbg !92
  store i8 %8, i8* %arrayidx5, align 1, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !104
  %inc = add i32 %16, 1, !dbg !104
  store i32 %inc, i32* %i, align 4, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %17 = load i32, i32* %len.addr, align 4, !dbg !109
  %18 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !110
  %in6 = getelementptr inbounds %struct.kfifo, %struct.kfifo* %18, i32 0, i32 2, !dbg !111
  %19 = load i32, i32* %in6, align 4, !dbg !112
  %add7 = add i32 %19, %17, !dbg !112
  store i32 %add7, i32* %in6, align 4, !dbg !112
  %20 = load i32, i32* %len.addr, align 4, !dbg !113
  store i32 %20, i32* %retval, align 4, !dbg !114
  br label %return, !dbg !114

return:                                           ; preds = %for.end, %if.then
  %21 = load i32, i32* %retval, align 4, !dbg !115
  ret i32 %21, !dbg !115
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @kfifo_get(%struct.kfifo* %fifo, i8* %buf, i32 %len) #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  %fifo.addr = alloca %struct.kfifo*, align 8
  %buf.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.kfifo* %fifo, %struct.kfifo** %fifo.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.kfifo** %fifo.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !125
  %call = call i32 @kfifo_len(%struct.kfifo* %0), !dbg !127
  %1 = load i32, i32* %len.addr, align 4, !dbg !128
  %cmp = icmp ult i32 %call, %1, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !131
  br label %return, !dbg !131

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !132, metadata !DIExpression()), !dbg !134
  store i32 0, i32* %i, align 4, !dbg !134
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !136
  %3 = load i32, i32* %len.addr, align 4, !dbg !138
  %cmp1 = icmp ult i32 %2, %3, !dbg !139
  br i1 %cmp1, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %4 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !141
  %buffer = getelementptr inbounds %struct.kfifo, %struct.kfifo* %4, i32 0, i32 0, !dbg !143
  %5 = load i8*, i8** %buffer, align 8, !dbg !143
  %6 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !144
  %out = getelementptr inbounds %struct.kfifo, %struct.kfifo* %6, i32 0, i32 3, !dbg !145
  %7 = load i32, i32* %out, align 8, !dbg !145
  %8 = load i32, i32* %i, align 4, !dbg !146
  %add = add i32 %7, %8, !dbg !147
  %9 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !148
  %size = getelementptr inbounds %struct.kfifo, %struct.kfifo* %9, i32 0, i32 1, !dbg !149
  %10 = load i32, i32* %size, align 8, !dbg !149
  %int_cast_to_i64 = zext i32 %10 to i64, !dbg !150
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !150
  %rem = urem i32 %add, %10, !dbg !150, !klee.check.div !101
  %idxprom = zext i32 %rem to i64, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !141
  %11 = load i8, i8* %arrayidx, align 1, !dbg !141
  %12 = load i8*, i8** %buf.addr, align 8, !dbg !151
  %13 = load i32, i32* %i, align 4, !dbg !152
  %idxprom2 = zext i32 %13 to i64, !dbg !151
  %arrayidx3 = getelementptr inbounds i8, i8* %12, i64 %idxprom2, !dbg !151
  store i8 %11, i8* %arrayidx3, align 1, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !155
  %inc = add i32 %14, 1, !dbg !155
  store i32 %inc, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* %len.addr, align 4, !dbg !159
  %16 = load %struct.kfifo*, %struct.kfifo** %fifo.addr, align 8, !dbg !160
  %out4 = getelementptr inbounds %struct.kfifo, %struct.kfifo* %16, i32 0, i32 3, !dbg !161
  %17 = load i32, i32* %out4, align 8, !dbg !162
  %add5 = add i32 %17, %15, !dbg !162
  store i32 %add5, i32* %out4, align 8, !dbg !162
  %18 = load i32, i32* %len.addr, align 4, !dbg !163
  store i32 %18, i32* %retval, align 4, !dbg !164
  br label %return, !dbg !164

return:                                           ; preds = %for.end, %if.then
  %19 = load i32, i32* %retval, align 4, !dbg !165
  ret i32 %19, !dbg !165
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !166 {
entry:
  %retval = alloca i32, align 4
  %fifo = alloca %struct.kfifo, align 8
  %buffer = alloca [8 x i8], align 1
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  %out1 = alloca i8, align 1
  %out2 = alloca i8, align 1
  %g1 = alloca i32, align 4
  %g2 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.kfifo* %fifo, metadata !170, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [8 x i8]* %buffer, metadata !178, metadata !DIExpression()), !dbg !182
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %buffer, i64 0, i64 0, !dbg !183
  call void @kfifo_init(%struct.kfifo* %fifo, i8* %arraydecay, i32 8), !dbg !184
  call void @llvm.dbg.declare(metadata i8* %a, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i8* %b, metadata !187, metadata !DIExpression()), !dbg !188
  call void @klee_make_symbolic(i8* %a, i64 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !189
  call void @klee_make_symbolic(i8* %b, i64 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !190
  call void @llvm.dbg.declare(metadata i32* %r1, metadata !191, metadata !DIExpression()), !dbg !192
  %call = call i32 @kfifo_put(%struct.kfifo* %fifo, i8* %a, i32 1), !dbg !193
  store i32 %call, i32* %r1, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata i32* %r2, metadata !194, metadata !DIExpression()), !dbg !195
  %call1 = call i32 @kfifo_put(%struct.kfifo* %fifo, i8* %b, i32 1), !dbg !196
  store i32 %call1, i32* %r2, align 4, !dbg !195
  %0 = load i32, i32* %r1, align 4, !dbg !197
  %cmp = icmp eq i32 %0, 1, !dbg !199
  br i1 %cmp, label %land.lhs.true, label %if.end21, !dbg !200

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %r2, align 4, !dbg !201
  %cmp2 = icmp eq i32 %1, 1, !dbg !202
  br i1 %cmp2, label %if.then, label %if.end21, !dbg !203

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata i8* %out1, metadata !204, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i8* %out2, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata i32* %g1, metadata !209, metadata !DIExpression()), !dbg !210
  %call3 = call i32 @kfifo_get(%struct.kfifo* %fifo, i8* %out1, i32 1), !dbg !211
  store i32 %call3, i32* %g1, align 4, !dbg !210
  call void @llvm.dbg.declare(metadata i32* %g2, metadata !212, metadata !DIExpression()), !dbg !213
  %call4 = call i32 @kfifo_get(%struct.kfifo* %fifo, i8* %out2, i32 1), !dbg !214
  store i32 %call4, i32* %g2, align 4, !dbg !213
  %2 = load i32, i32* %g1, align 4, !dbg !215
  %cmp5 = icmp eq i32 %2, 1, !dbg !217
  br i1 %cmp5, label %land.lhs.true6, label %if.end20, !dbg !218

land.lhs.true6:                                   ; preds = %if.then
  %3 = load i32, i32* %g2, align 4, !dbg !219
  %cmp7 = icmp eq i32 %3, 1, !dbg !220
  br i1 %cmp7, label %if.then8, label %if.end20, !dbg !221

if.then8:                                         ; preds = %land.lhs.true6
  %4 = load i8, i8* %out1, align 1, !dbg !222
  %conv = zext i8 %4 to i32, !dbg !222
  %5 = load i8, i8* %a, align 1, !dbg !222
  %conv9 = zext i8 %5 to i32, !dbg !222
  %cmp10 = icmp eq i32 %conv, %conv9, !dbg !222
  br i1 %cmp10, label %if.then12, label %if.else, !dbg !226

if.then12:                                        ; preds = %if.then8
  br label %if.end, !dbg !226

if.else:                                          ; preds = %if.then8
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i32 29, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !222
  unreachable, !dbg !222

if.end:                                           ; preds = %if.then12
  %6 = load i8, i8* %out2, align 1, !dbg !227
  %conv13 = zext i8 %6 to i32, !dbg !227
  %7 = load i8, i8* %b, align 1, !dbg !227
  %conv14 = zext i8 %7 to i32, !dbg !227
  %cmp15 = icmp eq i32 %conv13, %conv14, !dbg !227
  br i1 %cmp15, label %if.then17, label %if.else18, !dbg !230

if.then17:                                        ; preds = %if.end
  br label %if.end19, !dbg !230

if.else18:                                        ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i32 30, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !227
  unreachable, !dbg !227

if.end19:                                         ; preds = %if.then17
  br label %if.end20, !dbg !231

if.end20:                                         ; preds = %if.end19, %land.lhs.true6, %if.then
  br label %if.end21, !dbg !232

if.end21:                                         ; preds = %if.end20, %land.lhs.true, %entry
  ret i32 0, !dbg !233
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %z) #4 !dbg !234 {
entry:
  %z.addr = alloca i64, align 8
  store i64 %z, i64* %z.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %z.addr, metadata !239, metadata !DIExpression()), !dbg !240
  %0 = load i64, i64* %z.addr, align 8, !dbg !241
  %cmp = icmp eq i64 %0, 0, !dbg !243
  br i1 %cmp, label %if.then, label %if.end, !dbg !244

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.5, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.6, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.7, i64 0, i64 0)) #7, !dbg !245
  unreachable, !dbg !245

if.end:                                           ; preds = %entry
  ret void, !dbg !246
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0, !3, !5}
!llvm.ident = !{!7, !7, !7}
!llvm.module.flags = !{!8, !9, !10, !11, !12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "kfifo_model.c", directory: "/work/proofs/kfifo_klee")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "kfifo_klee_driver.c", directory: "/work/proofs/kfifo_klee")
!5 = distinct !DICompileUnit(language: DW_LANG_C89, file: !6, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!6 = !DIFile(filename: "/tmp/klee_src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/tmp/klee_build130stp_z3/runtime/Intrinsic")
!7 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = distinct !DISubprogram(name: "kfifo_init", scope: !1, file: !1, line: 4, type: !14, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16, !21, !24}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "kfifo", file: !18, line: 4, size: 192, elements: !19)
!18 = !DIFile(filename: "./kfifo_model.h", directory: "/work/proofs/kfifo_klee")
!19 = !{!20, !23, !25, !26}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !17, file: !18, line: 5, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !17, file: !18, line: 6, baseType: !24, size: 32, offset: 64)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "in", scope: !17, file: !18, line: 7, baseType: !24, size: 32, offset: 96)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "out", scope: !17, file: !18, line: 8, baseType: !24, size: 32, offset: 128)
!27 = !DILocalVariable(name: "fifo", arg: 1, scope: !13, file: !1, line: 4, type: !16)
!28 = !DILocation(line: 4, column: 31, scope: !13)
!29 = !DILocalVariable(name: "buffer", arg: 2, scope: !13, file: !1, line: 4, type: !21)
!30 = !DILocation(line: 4, column: 52, scope: !13)
!31 = !DILocalVariable(name: "size", arg: 3, scope: !13, file: !1, line: 4, type: !24)
!32 = !DILocation(line: 4, column: 73, scope: !13)
!33 = !DILocation(line: 5, column: 20, scope: !13)
!34 = !DILocation(line: 5, column: 5, scope: !13)
!35 = !DILocation(line: 5, column: 11, scope: !13)
!36 = !DILocation(line: 5, column: 18, scope: !13)
!37 = !DILocation(line: 6, column: 18, scope: !13)
!38 = !DILocation(line: 6, column: 5, scope: !13)
!39 = !DILocation(line: 6, column: 11, scope: !13)
!40 = !DILocation(line: 6, column: 16, scope: !13)
!41 = !DILocation(line: 7, column: 5, scope: !13)
!42 = !DILocation(line: 7, column: 11, scope: !13)
!43 = !DILocation(line: 7, column: 14, scope: !13)
!44 = !DILocation(line: 8, column: 5, scope: !13)
!45 = !DILocation(line: 8, column: 11, scope: !13)
!46 = !DILocation(line: 8, column: 15, scope: !13)
!47 = !DILocation(line: 9, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "kfifo_len", scope: !1, file: !1, line: 11, type: !49, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!24, !16}
!51 = !DILocalVariable(name: "fifo", arg: 1, scope: !48, file: !1, line: 11, type: !16)
!52 = !DILocation(line: 11, column: 38, scope: !48)
!53 = !DILocation(line: 12, column: 12, scope: !48)
!54 = !DILocation(line: 12, column: 18, scope: !48)
!55 = !DILocation(line: 12, column: 23, scope: !48)
!56 = !DILocation(line: 12, column: 29, scope: !48)
!57 = !DILocation(line: 12, column: 21, scope: !48)
!58 = !DILocation(line: 12, column: 5, scope: !48)
!59 = distinct !DISubprogram(name: "kfifo_put", scope: !1, file: !1, line: 15, type: !60, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!24, !16, !62, !24}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!64 = !DILocalVariable(name: "fifo", arg: 1, scope: !59, file: !1, line: 15, type: !16)
!65 = !DILocation(line: 15, column: 38, scope: !59)
!66 = !DILocalVariable(name: "buf", arg: 2, scope: !59, file: !1, line: 15, type: !62)
!67 = !DILocation(line: 15, column: 65, scope: !59)
!68 = !DILocalVariable(name: "len", arg: 3, scope: !59, file: !1, line: 15, type: !24)
!69 = !DILocation(line: 15, column: 83, scope: !59)
!70 = !DILocation(line: 16, column: 19, scope: !71)
!71 = distinct !DILexicalBlock(scope: !59, file: !1, line: 16, column: 9)
!72 = !DILocation(line: 16, column: 9, scope: !71)
!73 = !DILocation(line: 16, column: 27, scope: !71)
!74 = !DILocation(line: 16, column: 25, scope: !71)
!75 = !DILocation(line: 16, column: 33, scope: !71)
!76 = !DILocation(line: 16, column: 39, scope: !71)
!77 = !DILocation(line: 16, column: 31, scope: !71)
!78 = !DILocation(line: 16, column: 9, scope: !59)
!79 = !DILocation(line: 17, column: 9, scope: !71)
!80 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 19, type: !24)
!81 = distinct !DILexicalBlock(scope: !59, file: !1, line: 19, column: 5)
!82 = !DILocation(line: 19, column: 23, scope: !81)
!83 = !DILocation(line: 19, column: 10, scope: !81)
!84 = !DILocation(line: 19, column: 30, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 19, column: 5)
!86 = !DILocation(line: 19, column: 34, scope: !85)
!87 = !DILocation(line: 19, column: 32, scope: !85)
!88 = !DILocation(line: 19, column: 5, scope: !81)
!89 = !DILocation(line: 20, column: 53, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 19, column: 44)
!91 = !DILocation(line: 20, column: 57, scope: !90)
!92 = !DILocation(line: 20, column: 9, scope: !90)
!93 = !DILocation(line: 20, column: 15, scope: !90)
!94 = !DILocation(line: 20, column: 23, scope: !90)
!95 = !DILocation(line: 20, column: 29, scope: !90)
!96 = !DILocation(line: 20, column: 34, scope: !90)
!97 = !DILocation(line: 20, column: 32, scope: !90)
!98 = !DILocation(line: 20, column: 39, scope: !90)
!99 = !DILocation(line: 20, column: 45, scope: !90)
!100 = !DILocation(line: 20, column: 37, scope: !90)
!101 = !{!"True"}
!102 = !DILocation(line: 20, column: 51, scope: !90)
!103 = !DILocation(line: 21, column: 5, scope: !90)
!104 = !DILocation(line: 19, column: 40, scope: !85)
!105 = !DILocation(line: 19, column: 5, scope: !85)
!106 = distinct !{!106, !88, !107, !108}
!107 = !DILocation(line: 21, column: 5, scope: !81)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocation(line: 22, column: 17, scope: !59)
!110 = !DILocation(line: 22, column: 5, scope: !59)
!111 = !DILocation(line: 22, column: 11, scope: !59)
!112 = !DILocation(line: 22, column: 14, scope: !59)
!113 = !DILocation(line: 23, column: 12, scope: !59)
!114 = !DILocation(line: 23, column: 5, scope: !59)
!115 = !DILocation(line: 24, column: 1, scope: !59)
!116 = distinct !DISubprogram(name: "kfifo_get", scope: !1, file: !1, line: 26, type: !117, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DISubroutineType(types: !118)
!118 = !{!24, !16, !21, !24}
!119 = !DILocalVariable(name: "fifo", arg: 1, scope: !116, file: !1, line: 26, type: !16)
!120 = !DILocation(line: 26, column: 38, scope: !116)
!121 = !DILocalVariable(name: "buf", arg: 2, scope: !116, file: !1, line: 26, type: !21)
!122 = !DILocation(line: 26, column: 59, scope: !116)
!123 = !DILocalVariable(name: "len", arg: 3, scope: !116, file: !1, line: 26, type: !24)
!124 = !DILocation(line: 26, column: 77, scope: !116)
!125 = !DILocation(line: 27, column: 19, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !1, line: 27, column: 9)
!127 = !DILocation(line: 27, column: 9, scope: !126)
!128 = !DILocation(line: 27, column: 27, scope: !126)
!129 = !DILocation(line: 27, column: 25, scope: !126)
!130 = !DILocation(line: 27, column: 9, scope: !116)
!131 = !DILocation(line: 28, column: 9, scope: !126)
!132 = !DILocalVariable(name: "i", scope: !133, file: !1, line: 30, type: !24)
!133 = distinct !DILexicalBlock(scope: !116, file: !1, line: 30, column: 5)
!134 = !DILocation(line: 30, column: 23, scope: !133)
!135 = !DILocation(line: 30, column: 10, scope: !133)
!136 = !DILocation(line: 30, column: 30, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !1, line: 30, column: 5)
!138 = !DILocation(line: 30, column: 34, scope: !137)
!139 = !DILocation(line: 30, column: 32, scope: !137)
!140 = !DILocation(line: 30, column: 5, scope: !133)
!141 = !DILocation(line: 31, column: 18, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !1, line: 30, column: 44)
!143 = !DILocation(line: 31, column: 24, scope: !142)
!144 = !DILocation(line: 31, column: 32, scope: !142)
!145 = !DILocation(line: 31, column: 38, scope: !142)
!146 = !DILocation(line: 31, column: 44, scope: !142)
!147 = !DILocation(line: 31, column: 42, scope: !142)
!148 = !DILocation(line: 31, column: 49, scope: !142)
!149 = !DILocation(line: 31, column: 55, scope: !142)
!150 = !DILocation(line: 31, column: 47, scope: !142)
!151 = !DILocation(line: 31, column: 9, scope: !142)
!152 = !DILocation(line: 31, column: 13, scope: !142)
!153 = !DILocation(line: 31, column: 16, scope: !142)
!154 = !DILocation(line: 32, column: 5, scope: !142)
!155 = !DILocation(line: 30, column: 40, scope: !137)
!156 = !DILocation(line: 30, column: 5, scope: !137)
!157 = distinct !{!157, !140, !158, !108}
!158 = !DILocation(line: 32, column: 5, scope: !133)
!159 = !DILocation(line: 33, column: 18, scope: !116)
!160 = !DILocation(line: 33, column: 5, scope: !116)
!161 = !DILocation(line: 33, column: 11, scope: !116)
!162 = !DILocation(line: 33, column: 15, scope: !116)
!163 = !DILocation(line: 34, column: 12, scope: !116)
!164 = !DILocation(line: 34, column: 5, scope: !116)
!165 = !DILocation(line: 35, column: 1, scope: !116)
!166 = distinct !DISubprogram(name: "main", scope: !4, file: !4, line: 9, type: !167, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!167 = !DISubroutineType(types: !168)
!168 = !{!169}
!169 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!170 = !DILocalVariable(name: "fifo", scope: !166, file: !4, line: 10, type: !171)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "kfifo", file: !18, line: 4, size: 192, elements: !172)
!172 = !{!173, !174, !175, !176}
!173 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !171, file: !18, line: 5, baseType: !21, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !171, file: !18, line: 6, baseType: !24, size: 32, offset: 64)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "in", scope: !171, file: !18, line: 7, baseType: !24, size: 32, offset: 96)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "out", scope: !171, file: !18, line: 8, baseType: !24, size: 32, offset: 128)
!177 = !DILocation(line: 10, column: 18, scope: !166)
!178 = !DILocalVariable(name: "buffer", scope: !166, file: !4, line: 11, type: !179)
!179 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 64, elements: !180)
!180 = !{!181}
!181 = !DISubrange(count: 8)
!182 = !DILocation(line: 11, column: 19, scope: !166)
!183 = !DILocation(line: 13, column: 23, scope: !166)
!184 = !DILocation(line: 13, column: 5, scope: !166)
!185 = !DILocalVariable(name: "a", scope: !166, file: !4, line: 15, type: !22)
!186 = !DILocation(line: 15, column: 19, scope: !166)
!187 = !DILocalVariable(name: "b", scope: !166, file: !4, line: 15, type: !22)
!188 = !DILocation(line: 15, column: 22, scope: !166)
!189 = !DILocation(line: 16, column: 5, scope: !166)
!190 = !DILocation(line: 17, column: 5, scope: !166)
!191 = !DILocalVariable(name: "r1", scope: !166, file: !4, line: 19, type: !169)
!192 = !DILocation(line: 19, column: 9, scope: !166)
!193 = !DILocation(line: 19, column: 14, scope: !166)
!194 = !DILocalVariable(name: "r2", scope: !166, file: !4, line: 20, type: !169)
!195 = !DILocation(line: 20, column: 9, scope: !166)
!196 = !DILocation(line: 20, column: 14, scope: !166)
!197 = !DILocation(line: 22, column: 9, scope: !198)
!198 = distinct !DILexicalBlock(scope: !166, file: !4, line: 22, column: 9)
!199 = !DILocation(line: 22, column: 12, scope: !198)
!200 = !DILocation(line: 22, column: 17, scope: !198)
!201 = !DILocation(line: 22, column: 20, scope: !198)
!202 = !DILocation(line: 22, column: 23, scope: !198)
!203 = !DILocation(line: 22, column: 9, scope: !166)
!204 = !DILocalVariable(name: "out1", scope: !205, file: !4, line: 23, type: !22)
!205 = distinct !DILexicalBlock(scope: !198, file: !4, line: 22, column: 29)
!206 = !DILocation(line: 23, column: 23, scope: !205)
!207 = !DILocalVariable(name: "out2", scope: !205, file: !4, line: 23, type: !22)
!208 = !DILocation(line: 23, column: 29, scope: !205)
!209 = !DILocalVariable(name: "g1", scope: !205, file: !4, line: 25, type: !169)
!210 = !DILocation(line: 25, column: 13, scope: !205)
!211 = !DILocation(line: 25, column: 18, scope: !205)
!212 = !DILocalVariable(name: "g2", scope: !205, file: !4, line: 26, type: !169)
!213 = !DILocation(line: 26, column: 13, scope: !205)
!214 = !DILocation(line: 26, column: 18, scope: !205)
!215 = !DILocation(line: 28, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !205, file: !4, line: 28, column: 13)
!217 = !DILocation(line: 28, column: 16, scope: !216)
!218 = !DILocation(line: 28, column: 21, scope: !216)
!219 = !DILocation(line: 28, column: 24, scope: !216)
!220 = !DILocation(line: 28, column: 27, scope: !216)
!221 = !DILocation(line: 28, column: 13, scope: !205)
!222 = !DILocation(line: 29, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !224, file: !4, line: 29, column: 13)
!224 = distinct !DILexicalBlock(scope: !225, file: !4, line: 29, column: 13)
!225 = distinct !DILexicalBlock(scope: !216, file: !4, line: 28, column: 33)
!226 = !DILocation(line: 29, column: 13, scope: !224)
!227 = !DILocation(line: 30, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !229, file: !4, line: 30, column: 13)
!229 = distinct !DILexicalBlock(scope: !225, file: !4, line: 30, column: 13)
!230 = !DILocation(line: 30, column: 13, scope: !229)
!231 = !DILocation(line: 31, column: 9, scope: !225)
!232 = !DILocation(line: 32, column: 5, scope: !205)
!233 = !DILocation(line: 34, column: 5, scope: !166)
!234 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !235, file: !235, line: 12, type: !236, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !2)
!235 = !DIFile(filename: "klee_src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/tmp")
!236 = !DISubroutineType(types: !237)
!237 = !{null, !238}
!238 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!239 = !DILocalVariable(name: "z", arg: 1, scope: !234, file: !235, line: 12, type: !238)
!240 = !DILocation(line: 12, column: 36, scope: !234)
!241 = !DILocation(line: 13, column: 7, scope: !242)
!242 = distinct !DILexicalBlock(scope: !234, file: !235, line: 13, column: 7)
!243 = !DILocation(line: 13, column: 9, scope: !242)
!244 = !DILocation(line: 13, column: 7, scope: !234)
!245 = !DILocation(line: 14, column: 5, scope: !242)
!246 = !DILocation(line: 15, column: 1, scope: !234)
