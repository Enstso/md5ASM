
md5Gen.o:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    rsp,0x8
    1004:	48 8b 05 c5 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fc5]        # 3fd0 <__gmon_start__@Base>
    100b:	48 85 c0             	test   rax,rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   rax
    1012:	48 83 c4 08          	add    rsp,0x8
    1016:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <free@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   QWORD PTR [rip+0x2fca]        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    QWORD PTR [rip+0x2fcc]        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001030 <free@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    QWORD PTR [rip+0x2fca]        # 4000 <free@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <puts@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    QWORD PTR [rip+0x2fc2]        # 4008 <puts@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <strlen@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    QWORD PTR [rip+0x2fba]        # 4010 <strlen@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <memset@plt>:
    1060:	ff 25 b2 2f 00 00    	jmp    QWORD PTR [rip+0x2fb2]        # 4018 <memset@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001070 <memcpy@plt>:
    1070:	ff 25 aa 2f 00 00    	jmp    QWORD PTR [rip+0x2faa]        # 4020 <memcpy@GLIBC_2.14>
    1076:	68 04 00 00 00       	push   0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001080 <malloc@plt>:
    1080:	ff 25 a2 2f 00 00    	jmp    QWORD PTR [rip+0x2fa2]        # 4028 <malloc@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	push   0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001090 <sprintf@plt>:
    1090:	ff 25 9a 2f 00 00    	jmp    QWORD PTR [rip+0x2f9a]        # 4030 <sprintf@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	push   0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

00000000000010a0 <__cxa_finalize@plt>:
    10a0:	ff 25 3a 2f 00 00    	jmp    QWORD PTR [rip+0x2f3a]        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    10a6:	66 90                	xchg   ax,ax

Disassembly of section .text:

00000000000010b0 <_start>:
    10b0:	31 ed                	xor    ebp,ebp
    10b2:	49 89 d1             	mov    r9,rdx
    10b5:	5e                   	pop    rsi
    10b6:	48 89 e2             	mov    rdx,rsp
    10b9:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    10bd:	50                   	push   rax
    10be:	54                   	push   rsp
    10bf:	45 31 c0             	xor    r8d,r8d
    10c2:	31 c9                	xor    ecx,ecx
    10c4:	48 8d 3d 20 05 00 00 	lea    rdi,[rip+0x520]        # 15eb <main>
    10cb:	ff 15 ef 2e 00 00    	call   QWORD PTR [rip+0x2eef]        # 3fc0 <__libc_start_main@GLIBC_2.34>
    10d1:	f4                   	hlt
    10d2:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    10d9:	00 00 00 
    10dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000010e0 <deregister_tm_clones>:
    10e0:	48 8d 3d 99 31 00 00 	lea    rdi,[rip+0x3199]        # 4280 <__TMC_END__>
    10e7:	48 8d 05 92 31 00 00 	lea    rax,[rip+0x3192]        # 4280 <__TMC_END__>
    10ee:	48 39 f8             	cmp    rax,rdi
    10f1:	74 15                	je     1108 <deregister_tm_clones+0x28>
    10f3:	48 8b 05 ce 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ece]        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10fa:	48 85 c0             	test   rax,rax
    10fd:	74 09                	je     1108 <deregister_tm_clones+0x28>
    10ff:	ff e0                	jmp    rax
    1101:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1108:	c3                   	ret
    1109:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001110 <register_tm_clones>:
    1110:	48 8d 3d 69 31 00 00 	lea    rdi,[rip+0x3169]        # 4280 <__TMC_END__>
    1117:	48 8d 35 62 31 00 00 	lea    rsi,[rip+0x3162]        # 4280 <__TMC_END__>
    111e:	48 29 fe             	sub    rsi,rdi
    1121:	48 89 f0             	mov    rax,rsi
    1124:	48 c1 ee 3f          	shr    rsi,0x3f
    1128:	48 c1 f8 03          	sar    rax,0x3
    112c:	48 01 c6             	add    rsi,rax
    112f:	48 d1 fe             	sar    rsi,1
    1132:	74 14                	je     1148 <register_tm_clones+0x38>
    1134:	48 8b 05 9d 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e9d]        # 3fd8 <_ITM_registerTMCloneTable@Base>
    113b:	48 85 c0             	test   rax,rax
    113e:	74 08                	je     1148 <register_tm_clones+0x38>
    1140:	ff e0                	jmp    rax
    1142:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1148:	c3                   	ret
    1149:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001150 <__do_global_dtors_aux>:
    1150:	f3 0f 1e fa          	endbr64
    1154:	80 3d 25 31 00 00 00 	cmp    BYTE PTR [rip+0x3125],0x0        # 4280 <__TMC_END__>
    115b:	75 2b                	jne    1188 <__do_global_dtors_aux+0x38>
    115d:	55                   	push   rbp
    115e:	48 83 3d 7a 2e 00 00 	cmp    QWORD PTR [rip+0x2e7a],0x0        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1165:	00 
    1166:	48 89 e5             	mov    rbp,rsp
    1169:	74 0c                	je     1177 <__do_global_dtors_aux+0x27>
    116b:	48 8b 3d d6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ed6]        # 4048 <__dso_handle>
    1172:	e8 29 ff ff ff       	call   10a0 <__cxa_finalize@plt>
    1177:	e8 64 ff ff ff       	call   10e0 <deregister_tm_clones>
    117c:	c6 05 fd 30 00 00 01 	mov    BYTE PTR [rip+0x30fd],0x1        # 4280 <__TMC_END__>
    1183:	5d                   	pop    rbp
    1184:	c3                   	ret
    1185:	0f 1f 00             	nop    DWORD PTR [rax]
    1188:	c3                   	ret
    1189:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001190 <frame_dummy>:
    1190:	f3 0f 1e fa          	endbr64
    1194:	e9 77 ff ff ff       	jmp    1110 <register_tm_clones>

0000000000001199 <preprocess_message>:
    1199:	55                   	push   rbp
    119a:	48 89 e5             	mov    rbp,rsp
    119d:	48 83 ec 30          	sub    rsp,0x30
    11a1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    11a5:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    11a9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    11ad:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    11b1:	b8 37 00 00 00       	mov    eax,0x37
    11b6:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
    11ba:	83 e0 3f             	and    eax,0x3f
    11bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    11c1:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    11c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    11c9:	48 01 d0             	add    rax,rdx
    11cc:	48 8d 50 09          	lea    rdx,[rax+0x9]
    11d0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    11d4:	48 89 10             	mov    QWORD PTR [rax],rdx
    11d7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    11db:	48 8b 00             	mov    rax,QWORD PTR [rax]
    11de:	48 89 c7             	mov    rdi,rax
    11e1:	e8 9a fe ff ff       	call   1080 <malloc@plt>
    11e6:	48 89 c2             	mov    rdx,rax
    11e9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    11ed:	48 89 10             	mov    QWORD PTR [rax],rdx
    11f0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    11f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
    11f7:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    11fb:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    11ff:	48 89 ce             	mov    rsi,rcx
    1202:	48 89 c7             	mov    rdi,rax
    1205:	e8 66 fe ff ff       	call   1070 <memcpy@plt>
    120a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    120e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1211:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1215:	48 01 d0             	add    rax,rdx
    1218:	c6 00 80             	mov    BYTE PTR [rax],0x80
    121b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    121f:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1222:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    1226:	48 83 c2 01          	add    rdx,0x1
    122a:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
    122e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1232:	48 89 c2             	mov    rdx,rax
    1235:	be 00 00 00 00       	mov    esi,0x0
    123a:	48 89 cf             	mov    rdi,rcx
    123d:	e8 1e fe ff ff       	call   1060 <memset@plt>
    1242:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1246:	48 c1 e0 03          	shl    rax,0x3
    124a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    124e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1252:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1255:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
    1259:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    125d:	48 01 ca             	add    rdx,rcx
    1260:	48 83 c2 01          	add    rdx,0x1
    1264:	48 01 c2             	add    rdx,rax
    1267:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    126b:	48 89 02             	mov    QWORD PTR [rdx],rax
    126e:	90                   	nop
    126f:	c9                   	leave
    1270:	c3                   	ret

0000000000001271 <process_block>:
    1271:	55                   	push   rbp
    1272:	48 89 e5             	mov    rbp,rsp
    1275:	48 83 ec 28          	sub    rsp,0x28
    1279:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
    127d:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
    1281:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
    1288:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
    128f:	4c 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],r8
    1296:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    129a:	8b 00                	mov    eax,DWORD PTR [rax]
    129c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    129f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    12a6:	8b 00                	mov    eax,DWORD PTR [rax]
    12a8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    12ab:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    12b2:	8b 00                	mov    eax,DWORD PTR [rax]
    12b4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    12b7:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    12be:	8b 00                	mov    eax,DWORD PTR [rax]
    12c0:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    12c3:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    12ca:	eb 7e                	jmp    134a <process_block+0xd9>
    12cc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    12cf:	c1 e0 02             	shl    eax,0x2
    12d2:	48 63 d0             	movsxd rdx,eax
    12d5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    12d9:	48 01 d0             	add    rax,rdx
    12dc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    12df:	0f b6 c0             	movzx  eax,al
    12e2:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
    12e5:	c1 e2 02             	shl    edx,0x2
    12e8:	48 63 d2             	movsxd rdx,edx
    12eb:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
    12ef:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
    12f3:	48 01 ca             	add    rdx,rcx
    12f6:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
    12f9:	0f b6 d2             	movzx  edx,dl
    12fc:	c1 e2 08             	shl    edx,0x8
    12ff:	09 c2                	or     edx,eax
    1301:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    1304:	c1 e0 02             	shl    eax,0x2
    1307:	48 98                	cdqe
    1309:	48 8d 48 02          	lea    rcx,[rax+0x2]
    130d:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    1311:	48 01 c8             	add    rax,rcx
    1314:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    1317:	0f b6 c0             	movzx  eax,al
    131a:	c1 e0 10             	shl    eax,0x10
    131d:	09 c2                	or     edx,eax
    131f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    1322:	c1 e0 02             	shl    eax,0x2
    1325:	48 98                	cdqe
    1327:	48 8d 48 03          	lea    rcx,[rax+0x3]
    132b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    132f:	48 01 c8             	add    rax,rcx
    1332:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    1335:	0f b6 c0             	movzx  eax,al
    1338:	c1 e0 18             	shl    eax,0x18
    133b:	09 c2                	or     edx,eax
    133d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    1340:	48 98                	cdqe
    1342:	89 54 85 90          	mov    DWORD PTR [rbp+rax*4-0x70],edx
    1346:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
    134a:	83 7d e4 0f          	cmp    DWORD PTR [rbp-0x1c],0xf
    134e:	0f 8e 78 ff ff ff    	jle    12cc <process_block+0x5b>
    1354:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
    135b:	e9 fc 00 00 00       	jmp    145c <process_block+0x1eb>
    1360:	83 7d e0 0f          	cmp    DWORD PTR [rbp-0x20],0xf
    1364:	77 1d                	ja     1383 <process_block+0x112>
    1366:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    1369:	23 45 f4             	and    eax,DWORD PTR [rbp-0xc]
    136c:	89 c2                	mov    edx,eax
    136e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    1371:	f7 d0                	not    eax
    1373:	23 45 f0             	and    eax,DWORD PTR [rbp-0x10]
    1376:	09 d0                	or     eax,edx
    1378:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    137b:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    137e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    1381:	eb 74                	jmp    13f7 <process_block+0x186>
    1383:	83 7d e0 1f          	cmp    DWORD PTR [rbp-0x20],0x1f
    1387:	77 2a                	ja     13b3 <process_block+0x142>
    1389:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    138c:	23 45 f8             	and    eax,DWORD PTR [rbp-0x8]
    138f:	89 c2                	mov    edx,eax
    1391:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    1394:	f7 d0                	not    eax
    1396:	23 45 f4             	and    eax,DWORD PTR [rbp-0xc]
    1399:	09 d0                	or     eax,edx
    139b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    139e:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
    13a1:	89 d0                	mov    eax,edx
    13a3:	c1 e0 02             	shl    eax,0x2
    13a6:	01 d0                	add    eax,edx
    13a8:	83 c0 01             	add    eax,0x1
    13ab:	83 e0 0f             	and    eax,0xf
    13ae:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    13b1:	eb 44                	jmp    13f7 <process_block+0x186>
    13b3:	83 7d e0 2f          	cmp    DWORD PTR [rbp-0x20],0x2f
    13b7:	77 20                	ja     13d9 <process_block+0x168>
    13b9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    13bc:	33 45 f4             	xor    eax,DWORD PTR [rbp-0xc]
    13bf:	33 45 f0             	xor    eax,DWORD PTR [rbp-0x10]
    13c2:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    13c5:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
    13c8:	89 d0                	mov    eax,edx
    13ca:	01 c0                	add    eax,eax
    13cc:	01 d0                	add    eax,edx
    13ce:	83 c0 05             	add    eax,0x5
    13d1:	83 e0 0f             	and    eax,0xf
    13d4:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    13d7:	eb 1e                	jmp    13f7 <process_block+0x186>
    13d9:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    13dc:	f7 d0                	not    eax
    13de:	0b 45 f8             	or     eax,DWORD PTR [rbp-0x8]
    13e1:	33 45 f4             	xor    eax,DWORD PTR [rbp-0xc]
    13e4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    13e7:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
    13ea:	89 d0                	mov    eax,edx
    13ec:	c1 e0 03             	shl    eax,0x3
    13ef:	29 d0                	sub    eax,edx
    13f1:	83 e0 0f             	and    eax,0xf
    13f4:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    13f7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    13fa:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    13fd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1400:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    1403:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    1406:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    1409:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
    140c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    140f:	8d 0c 02             	lea    ecx,[rdx+rax*1]
    1412:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    1415:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    141c:	00 
    141d:	48 8d 05 5c 2c 00 00 	lea    rax,[rip+0x2c5c]        # 4080 <T>
    1424:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1427:	8d 14 01             	lea    edx,[rcx+rax*1]
    142a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    142d:	8b 44 85 90          	mov    eax,DWORD PTR [rbp+rax*4-0x70]
    1431:	8d 34 02             	lea    esi,[rdx+rax*1]
    1434:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
    1437:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    143e:	00 
    143f:	48 8d 05 3a 2d 00 00 	lea    rax,[rip+0x2d3a]        # 4180 <shifts>
    1446:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1449:	89 c1                	mov    ecx,eax
    144b:	d3 c6                	rol    esi,cl
    144d:	89 f0                	mov    eax,esi
    144f:	01 45 f8             	add    DWORD PTR [rbp-0x8],eax
    1452:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1455:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    1458:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
    145c:	83 7d e0 3f          	cmp    DWORD PTR [rbp-0x20],0x3f
    1460:	0f 86 fa fe ff ff    	jbe    1360 <process_block+0xef>
    1466:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    146a:	8b 10                	mov    edx,DWORD PTR [rax]
    146c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    146f:	01 c2                	add    edx,eax
    1471:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    1475:	89 10                	mov    DWORD PTR [rax],edx
    1477:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    147e:	8b 10                	mov    edx,DWORD PTR [rax]
    1480:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    1483:	01 c2                	add    edx,eax
    1485:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    148c:	89 10                	mov    DWORD PTR [rax],edx
    148e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    1495:	8b 10                	mov    edx,DWORD PTR [rax]
    1497:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    149a:	01 c2                	add    edx,eax
    149c:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    14a3:	89 10                	mov    DWORD PTR [rax],edx
    14a5:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    14ac:	8b 10                	mov    edx,DWORD PTR [rax]
    14ae:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    14b1:	01 c2                	add    edx,eax
    14b3:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    14ba:	89 10                	mov    DWORD PTR [rax],edx
    14bc:	90                   	nop
    14bd:	c9                   	leave
    14be:	c3                   	ret

00000000000014bf <md5>:
    14bf:	55                   	push   rbp
    14c0:	48 89 e5             	mov    rbp,rsp
    14c3:	48 83 ec 50          	sub    rsp,0x50
    14c7:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    14cb:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    14cf:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    14d6:	00 
    14d7:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    14de:	00 
    14df:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    14e3:	48 89 c7             	mov    rdi,rax
    14e6:	e8 65 fb ff ff       	call   1050 <strlen@plt>
    14eb:	48 89 c6             	mov    rsi,rax
    14ee:	48 8d 4d e0          	lea    rcx,[rbp-0x20]
    14f2:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
    14f6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    14fa:	48 89 c7             	mov    rdi,rax
    14fd:	e8 97 fc ff ff       	call   1199 <preprocess_message>
    1502:	8b 05 58 2b 00 00    	mov    eax,DWORD PTR [rip+0x2b58]        # 4060 <A>
    1508:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    150b:	8b 05 53 2b 00 00    	mov    eax,DWORD PTR [rip+0x2b53]        # 4064 <B>
    1511:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    1514:	8b 05 4e 2b 00 00    	mov    eax,DWORD PTR [rip+0x2b4e]        # 4068 <C>
    151a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    151d:	8b 05 49 2b 00 00    	mov    eax,DWORD PTR [rip+0x2b49]        # 406c <D>
    1523:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    1526:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    152d:	00 
    152e:	eb 2c                	jmp    155c <md5+0x9d>
    1530:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1534:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1538:	48 8d 3c 02          	lea    rdi,[rdx+rax*1]
    153c:	48 8d 75 d0          	lea    rsi,[rbp-0x30]
    1540:	48 8d 4d d4          	lea    rcx,[rbp-0x2c]
    1544:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
    1548:	48 8d 45 dc          	lea    rax,[rbp-0x24]
    154c:	49 89 f0             	mov    r8,rsi
    154f:	48 89 c6             	mov    rsi,rax
    1552:	e8 1a fd ff ff       	call   1271 <process_block>
    1557:	48 83 45 f8 40       	add    QWORD PTR [rbp-0x8],0x40
    155c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1560:	48 39 45 f8          	cmp    QWORD PTR [rbp-0x8],rax
    1564:	72 ca                	jb     1530 <md5+0x71>
    1566:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    156a:	48 89 c7             	mov    rdi,rax
    156d:	e8 be fa ff ff       	call   1030 <free@plt>
    1572:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1575:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
    1578:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    157c:	48 83 c0 04          	add    rax,0x4
    1580:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
    1583:	89 10                	mov    DWORD PTR [rax],edx
    1585:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    1589:	48 83 c0 08          	add    rax,0x8
    158d:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
    1590:	89 10                	mov    DWORD PTR [rax],edx
    1592:	48 8d 45 c0          	lea    rax,[rbp-0x40]
    1596:	48 83 c0 0c          	add    rax,0xc
    159a:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
    159d:	89 10                	mov    DWORD PTR [rax],edx
    159f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    15a6:	eb 39                	jmp    15e1 <md5+0x122>
    15a8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    15ab:	48 98                	cdqe
    15ad:	0f b6 44 05 c0       	movzx  eax,BYTE PTR [rbp+rax*1-0x40]
    15b2:	0f b6 c0             	movzx  eax,al
    15b5:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    15b8:	01 d2                	add    edx,edx
    15ba:	48 63 ca             	movsxd rcx,edx
    15bd:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    15c1:	48 01 d1             	add    rcx,rdx
    15c4:	89 c2                	mov    edx,eax
    15c6:	48 8d 05 37 0a 00 00 	lea    rax,[rip+0xa37]        # 2004 <_IO_stdin_used+0x4>
    15cd:	48 89 c6             	mov    rsi,rax
    15d0:	48 89 cf             	mov    rdi,rcx
    15d3:	b8 00 00 00 00       	mov    eax,0x0
    15d8:	e8 b3 fa ff ff       	call   1090 <sprintf@plt>
    15dd:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    15e1:	83 7d f4 0f          	cmp    DWORD PTR [rbp-0xc],0xf
    15e5:	7e c1                	jle    15a8 <md5+0xe9>
    15e7:	90                   	nop
    15e8:	90                   	nop
    15e9:	c9                   	leave
    15ea:	c3                   	ret

00000000000015eb <main>:
    15eb:	55                   	push   rbp
    15ec:	48 89 e5             	mov    rbp,rsp
    15ef:	48 83 ec 30          	sub    rsp,0x30
    15f3:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
    15fa:	00 
    15fb:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
    1602:	00 
    1603:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    160a:	00 
    160b:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    1612:	00 
    1613:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    1617:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    161b:	48 89 c6             	mov    rsi,rax
    161e:	48 8d 05 e4 09 00 00 	lea    rax,[rip+0x9e4]        # 2009 <_IO_stdin_used+0x9>
    1625:	48 89 c7             	mov    rdi,rax
    1628:	e8 92 fe ff ff       	call   14bf <md5>
    162d:	48 8d 45 d0          	lea    rax,[rbp-0x30]
    1631:	48 89 c7             	mov    rdi,rax
    1634:	e8 07 fa ff ff       	call   1040 <puts@plt>
    1639:	b8 00 00 00 00       	mov    eax,0x0
    163e:	c9                   	leave
    163f:	c3                   	ret

Disassembly of section .fini:

0000000000001640 <_fini>:
    1640:	48 83 ec 08          	sub    rsp,0x8
    1644:	48 83 c4 08          	add    rsp,0x8
    1648:	c3                   	ret
