    default rel
    global _start
    
    section .text progbits alloc exec write
    extern _GLOBAL_OFFSET_TABLE_                            ; byte

    _start:
		; padding 4 bytes
		nop
		nop
		nop
		nop

		; padding 2 bytes
		nop
		nop

		; use 8 bytes
		mov     byte [abs 400050AH], -128

        mov     rax, qword 0BB67AE856A09E667H
        mov     r15d, 67108864
        ;sub     rsp, 152
        mov     qword [rsp+30H], rax
        mov     rax, qword 0A54FF53A3C6EF372H
        mov     qword [rsp+38H], rax
        mov     rax, qword 9B05688C510E527FH
        mov     qword [rsp+40H], rax
        mov     rax, qword 5BE0CD191F83D9ABH
        mov     qword [rsp+48H], rax
        mov     eax, 2565
        shl     rax, 51

        mov     esi, dword [rsp+38H]                    ; 005A _ 8B. 74 24, 38
        mov     ebx, dword [rsp+3CH]                    ; 005E _ 8B. 5C 24, 3C

        mov     qword [abs 4000538H], rax               ; 0062 _ 48: 89. 04 25, 04000538
        mov     eax, dword [rsp+30H]                    ; 006A _ 8B. 44 24, 30
        mov     edi, dword [rsp+48H]                    ; 006E _ 8B. 7C 24, 48
        mov     dword [rsp+1CH], esi                    ; 0072 _ 89. 74 24, 1C
        mov     r12d, dword [rsp+4CH]                   ; 0076 _ 44: 8B. 64 24, 4C
        mov     dword [rsp+18H], ebx                    ; 007B _ 89. 5C 24, 18
        mov     dword [rsp+10H], eax                    ; 007F _ 89. 44 24, 10
        mov     eax, dword [rsp+34H]                    ; 0083 _ 8B. 44 24, 34
        mov     dword [rsp+20H], edi                    ; 0087 _ 89. 7C 24, 20
        mov     dword [rsp+8H], eax                     ; 008B _ 89. 44 24, 08
        mov     eax, dword [rsp+40H]                    ; 008F _ 8B. 44 24, 40
        mov     dword [rsp+24H], r12d                   ; 0093 _ 44: 89. 64 24, 24
        mov     dword [rsp+0CH], eax                    ; 0098 _ 89. 44 24, 0C
        mov     eax, dword [rsp+44H]                    ; 009C _ 8B. 44 24, 44
        mov     dword [rsp+14H], eax                    ; 00A0 _ 89. 44 24, 14
?_001:  mov     r9d, dword [rsp+8H]                     ; 00A4 _ 44: 8B. 4C 24, 08
        mov     ecx, dword [rsp+10H]                    ; 00A9 _ 8B. 4C 24, 10
        xor     ebp, ebp                                ; 00AD _ 31. ED
        mov     r11d, dword [rsp+14H]                   ; 00AF _ 44: 8B. 5C 24, 14
        mov     edx, dword [rsp+0CH]                    ; 00B4 _ 8B. 54 24, 0C
?_002:  mov     r8d, edx                                ; 00B8 _ 41: 89. D0
        mov     r10d, edx                               ; 00BB _ 41: 89. D2
        mov     r13d, dword [r15+rbp]                   ; 00BE _ 45: 8B. 2C 2F
        lea     rax, [rel K256]                         ; 00C2 _ 48: 8D. 05, 000002A0(rel)
        ror     r8d, 6                                  ; 00C9 _ 41: C1. C8, 06
        ror     r10d, 11                                ; 00CD _ 41: C1. CA, 0B
        xor     r10d, r8d                               ; 00D1 _ 45: 31. C2
        mov     r8d, edx                                ; 00D4 _ 41: 89. D0
        bswap   r13d                                    ; 00D7 _ 41: 0F CD
        mov     dword [rsp+rbp+50H], r13d               ; 00DA _ 44: 89. 6C 2C, 50
        rol     r8d, 7                                  ; 00DF _ 41: C1. C0, 07
        add     r13d, dword [rax+rbp]                   ; 00E3 _ 44: 03. 2C 28
        mov     eax, edx                                ; 00E7 _ 89. D0
        add     rbp, 4                                  ; 00E9 _ 48: 83. C5, 04
        xor     r8d, r10d                               ; 00ED _ 45: 31. D0
        not     eax                                     ; 00F0 _ F7. D0
        mov     r10d, edx                               ; 00F2 _ 41: 89. D2
        and     r10d, r11d                              ; 00F5 _ 45: 21. DA
        and     eax, edi                                ; 00F8 _ 21. F8
        add     r8d, r13d                               ; 00FA _ 45: 01. E8
        xor     eax, r10d                               ; 00FD _ 44: 31. D0
        add     eax, r8d                                ; 0100 _ 44: 01. C0
        mov     r8d, ecx                                ; 0103 _ 41: 89. C8
        lea     r10d, [rax+r12]                         ; 0106 _ 46: 8D. 14 20
        mov     eax, ecx                                ; 010A _ 89. C8
        ror     r8d, 13                                 ; 010C _ 41: C1. C8, 0D
        mov     r12d, r9d                               ; 0110 _ 45: 89. CC
        ror     eax, 2                                  ; 0113 _ C1. C8, 02
        and     r12d, esi                               ; 0116 _ 41: 21. F4
        xor     r8d, eax                                ; 0119 _ 41: 31. C0
        mov     eax, ecx                                ; 011C _ 89. C8
        rol     eax, 10                                 ; 011E _ C1. C0, 0A
        xor     r8d, eax                                ; 0121 _ 41: 31. C0
        mov     eax, r9d                                ; 0124 _ 44: 89. C8
        xor     eax, esi                                ; 0127 _ 31. F0
        and     eax, ecx                                ; 0129 _ 21. C8
        xor     eax, r12d                               ; 012B _ 44: 31. E0
        mov     r12d, edi                               ; 012E _ 41: 89. FC
        add     eax, r8d                                ; 0131 _ 44: 01. C0
        lea     r8d, [r10+rbx]                          ; 0134 _ 45: 8D. 04 1A
        mov     ebx, esi                                ; 0138 _ 89. F3
        add     eax, r10d                               ; 013A _ 44: 01. D0
        cmp     rbp, 64                                 ; 013D _ 48: 83. FD, 40
        jz      ?_003                                   ; 0141 _ 74, 16
        mov     esi, r9d                                ; 0143 _ 44: 89. CE
        mov     edi, r11d                               ; 0146 _ 44: 89. DF
        mov     r9d, ecx                                ; 0149 _ 41: 89. C9
        mov     r11d, edx                               ; 014C _ 41: 89. D3
        mov     ecx, eax                                ; 014F _ 89. C1
        mov     edx, r8d                                ; 0151 _ 44: 89. C2
        jmp     ?_002                                   ; 0154 _ E9, FFFFFF5F


?_003:
        lea     rbx, [rel K256]                         ; 0159 _ 48: 8D. 1D, 00000209(rel)
        mov     dword [rsp+4H], 16                      ; 0160 _ C7. 44 24, 04, 00000010
        add     r15, 64                                 ; 0168 _ 49: 83. C7, 40
        mov     qword [rsp+28H], rbx                    ; 016C _ 48: 89. 5C 24, 28
?_004:  mov     ebx, dword [rsp+4H]                     ; 0171 _ 8B. 5C 24, 04
        inc     dword [rsp+4H]                          ; 0175 _ FF. 44 24, 04
        mov     r10d, dword [rsp+4H]                    ; 0179 _ 44: 8B. 54 24, 04
        and     r10d, 0FH                               ; 017E _ 41: 83. E2, 0F
        mov     r14d, dword [rsp+r10*4+50H]             ; 0182 _ 46: 8B. 74 94, 50
        mov     r13d, r14d                              ; 0187 _ 45: 89. F5
        mov     r10d, r14d                              ; 018A _ 45: 89. F2
        shr     r14d, 3                                 ; 018D _ 41: C1. EE, 03
        rol     r10d, 14                                ; 0191 _ 41: C1. C2, 0E
        ror     r13d, 7                                 ; 0195 _ 41: C1. CD, 07
        xor     r13d, r10d                              ; 0199 _ 45: 31. D5
        lea     r10d, [rbx+0EH]                         ; 019C _ 44: 8D. 53, 0E
        and     r10d, 0FH                               ; 01A0 _ 41: 83. E2, 0F
        xor     r13d, r14d                              ; 01A4 _ 45: 31. F5
        mov     r12d, dword [rsp+r10*4+50H]             ; 01A7 _ 46: 8B. 64 94, 50
        mov     ebp, r12d                               ; 01AC _ 44: 89. E5
        mov     r10d, r12d                              ; 01AF _ 45: 89. E2
        shr     r12d, 10                                ; 01B2 _ 41: C1. EC, 0A
        rol     r10d, 13                                ; 01B6 _ 41: C1. C2, 0D
        rol     ebp, 15                                 ; 01BA _ C1. C5, 0F
        xor     ebp, r10d                               ; 01BD _ 44: 31. D5
        lea     r10d, [rbx+9H]                          ; 01C0 _ 44: 8D. 53, 09
        and     ebx, 0FH                                ; 01C4 _ 83. E3, 0F
        and     r10d, 0FH                               ; 01C7 _ 41: 83. E2, 0F
        xor     ebp, r12d                               ; 01CB _ 44: 31. E5
        mov     r12d, r8d                               ; 01CE _ 45: 89. C4
        mov     r10d, dword [rsp+r10*4+50H]             ; 01D1 _ 46: 8B. 54 94, 50
        add     r10d, dword [rsp+rbx*4+50H]             ; 01D6 _ 44: 03. 54 9C, 50
        and     r12d, edx                               ; 01DB _ 41: 21. D4
        add     r13d, r10d                              ; 01DE _ 45: 01. D5
        mov     r10d, r8d                               ; 01E1 _ 45: 89. C2
        add     ebp, r13d                               ; 01E4 _ 44: 01. ED
        ror     r10d, 6                                 ; 01E7 _ 41: C1. CA, 06
        mov     dword [rsp+rbx*4+50H], ebp              ; 01EB _ 89. 6C 9C, 50
        mov     ebx, r8d                                ; 01EF _ 44: 89. C3
        ror     ebx, 11                                 ; 01F2 _ C1. CB, 0B
        xor     ebx, r10d                               ; 01F5 _ 44: 31. D3
        mov     r10d, r8d                               ; 01F8 _ 45: 89. C2
        rol     r10d, 7                                 ; 01FB _ 41: C1. C2, 07
        xor     ebx, r10d                               ; 01FF _ 44: 31. D3
        mov     r10d, r8d                               ; 0202 _ 45: 89. C2
        not     r10d                                    ; 0205 _ 41: F7. D2
        and     r10d, r11d                              ; 0208 _ 45: 21. DA
        xor     r10d, r12d                              ; 020B _ 45: 31. E2
        add     r10d, ebx                               ; 020E _ 41: 01. DA
        mov     rbx, qword [rsp+28H]                    ; 0211 _ 48: 8B. 5C 24, 28
        add     r10d, dword [rbx+40H]                   ; 0216 _ 44: 03. 53, 40
        mov     ebx, eax                                ; 021A _ 89. C3
        add     ebp, r10d                               ; 021C _ 44: 01. D5
        mov     r10d, eax                               ; 021F _ 41: 89. C2
        ror     ebx, 13                                 ; 0222 _ C1. CB, 0D
        ror     r10d, 2                                 ; 0225 _ 41: C1. CA, 02
        add     edi, ebp                                ; 0229 _ 01. EF
        mov     ebp, ecx                                ; 022B _ 89. CD
        xor     ebx, r10d                               ; 022D _ 44: 31. D3
        mov     r10d, eax                               ; 0230 _ 41: 89. C2
        and     ebp, r9d                                ; 0233 _ 44: 21. CD
        add     qword [rsp+28H], 4                      ; 0236 _ 48: 83. 44 24, 28, 04
        rol     r10d, 10                                ; 023C _ 41: C1. C2, 0A
        lea     r12d, [rdi+rsi]                         ; 0240 _ 44: 8D. 24 37
        mov     esi, r9d                                ; 0244 _ 44: 89. CE
        xor     ebx, r10d                               ; 0247 _ 44: 31. D3
        mov     r10d, ecx                               ; 024A _ 41: 89. CA
        xor     r10d, r9d                               ; 024D _ 45: 31. CA
        and     r10d, eax                               ; 0250 _ 41: 21. C2
        xor     ebp, r10d                               ; 0253 _ 44: 31. D5
        add     ebp, ebx                                ; 0256 _ 01. DD
        add     ebp, edi                                ; 0258 _ 01. FD
        cmp     dword [rsp+4H], 64                      ; 025A _ 83. 7C 24, 04, 40
        mov     edi, r11d                               ; 025F _ 44: 89. DF
        jz      ?_005                                   ; 0262 _ 74, 15
        mov     r9d, ecx                                ; 0264 _ 41: 89. C9
        mov     r11d, edx                               ; 0267 _ 41: 89. D3
        mov     ecx, eax                                ; 026A _ 89. C1
        mov     edx, r8d                                ; 026C _ 44: 89. C2
        mov     eax, ebp                                ; 026F _ 89. E8
        mov     r8d, r12d                               ; 0271 _ 45: 89. E0
        jmp     ?_004                                   ; 0274 _ E9, FFFFFEF8

    ?_005:  ; Local function
        add     dword [rsp+0CH], r12d                   ; 0279 _ 44: 01. 64 24, 0C
        mov     esi, dword [rsp+1CH]                    ; 027E _ 8B. 74 24, 1C
        mov     ebx, dword [rsp+18H]                    ; 0282 _ 8B. 5C 24, 18
        mov     edi, dword [rsp+20H]                    ; 0286 _ 8B. 7C 24, 20
        mov     r12d, dword [rsp+24H]                   ; 028A _ 44: 8B. 64 24, 24
        add     dword [rsp+10H], ebp                    ; 028F _ 01. 6C 24, 10
        add     esi, ecx                                ; 0293 _ 01. CE
        add     dword [rsp+8H], eax                     ; 0295 _ 01. 44 24, 08
        add     ebx, r9d                                ; 0299 _ 44: 01. CB
        add     edi, edx                                ; 029C _ 01. D7
        add     dword [rsp+14H], r8d                    ; 029E _ 44: 01. 44 24, 14
        add     r12d, r11d                              ; 02A3 _ 45: 01. DC
        cmp     r15, 67110208                           ; 02A6 _ 49: 81. FF, 04000540
        jz      ?_006                                   ; 02AD _ 74, 16
        mov     dword [rsp+18H], ebx                    ; 02AF _ 89. 5C 24, 18
        mov     dword [rsp+1CH], esi                    ; 02B3 _ 89. 74 24, 1C
        mov     dword [rsp+20H], edi                    ; 02B7 _ 89. 7C 24, 20
        mov     dword [rsp+24H], r12d                   ; 02BB _ 44: 89. 64 24, 24
        jmp     ?_001                                   ; 02C0 _ E9, FFFFFDDF

    ?_006:  ; Local function
            mov     eax, dword [rsp+10H]                    ; 02C5 _ 8B. 44 24, 10
            mov     dword [rsp+38H], esi                    ; 02C9 _ 89. 74 24, 38
            mov     dword [rsp+3CH], ebx                    ; 02CD _ 89. 5C 24, 3C
            mov     dword [rsp+30H], eax                    ; 02D1 _ 89. 44 24, 30
            mov     eax, dword [rsp+8H]                     ; 02D5 _ 8B. 44 24, 08
            mov     dword [rsp+48H], edi                    ; 02D9 _ 89. 7C 24, 48
            mov     dword [rsp+34H], eax                    ; 02DD _ 89. 44 24, 34
            mov     eax, dword [rsp+0CH]                    ; 02E1 _ 8B. 44 24, 0C
            mov     dword [rsp+4CH], r12d                   ; 02E5 _ 44: 89. 64 24, 4C
            lea     r12, [rsp+50H]                          ; 02EA _ 4C: 8D. 64 24, 50
            mov     dword [rsp+40H], eax                    ; 02EF _ 89. 44 24, 40
            mov     eax, dword [rsp+14H]                    ; 02F3 _ 8B. 44 24, 14
            mov     dword [rsp+44H], eax                    ; 02F7 _ 89. 44 24, 44
            lea     rax, [rsp+30H]                          ; 02FB _ 48: 8D. 44 24, 30
    ?_007:  mov     edx, dword [rax]                        ; 0300 _ 8B. 10
            add     rax, 4                                  ; 0302 _ 48: 83. C0, 04
            bswap   edx                                     ; 0306 _ 0F CA
            mov     dword [rax-4H], edx                     ; 0308 _ 89. 50, FC
            cmp     r12, rax                                ; 030B _ 49: 39. C4
            jnz     ?_007                                   ; 030E _ 75, F0
            xor     ebx, ebx                                ; 0310 _ 31. DB
            mov     ebp, 1                                  ; 0312 _ BD, 00000001
    ?_008:  mov     eax, ebx                                ; 0317 _ 89. D8
            mov     edx, ebx                                ; 0319 _ 89. DA
            mov     ecx, ebp                                ; 031B _ 89. E9
            sar     al, 1                                   ; 031D _ D0. F8
            and     edx, 01H                                ; 031F _ 83. E2, 01
            movsx   rax, al                                 ; 0322 _ 48: 0F BE. C0
            sub     ecx, edx                                ; 0326 _ 29. D1
            movzx   eax, byte [rsp+rax+30H]                 ; 0328 _ 0F B6. 44 04, 30
            shl     ecx, 2                                  ; 032D _ C1. E1, 02
            sar     eax, cl                                 ; 0330 _ D3. F8
            and     eax, 0FH                                ; 0332 _ 83. E0, 0F
            lea     edx, [rax+30H]                          ; 0335 _ 8D. 50, 30
            cmp     al, 9                                   ; 0338 _ 3C, 09
            jle     ?_009                                   ; 033A _ 7E, 03
            lea     edx, [rax+57H]                          ; 033C _ 8D. 50, 57
    ?_009:  mov     byte [rsp+50H], dl                      ; 033F _ 88. 54 24, 50
            mov     rsi, r12                                ; 0343 _ 4C: 89. E6
            mov     edx, 1                                  ; 0346 _ BA, 00000001
            inc     ebx                                     ; 034B _ FF. C3
            mov     edi, 1                                  ; 034D _ BF, 00000001

            mov eax, 1
            syscall

            cmp     bl, 64                                  ; 0357 _ 80. FB, 40
            jnz     ?_008                                   ; 035A _ 75, BB
            ;add     rsp, 152                                ; 035C _ 48: 81. C4, 00000098
            mov     eax, 60                                 ; 0363 _ B8, 0000003C

            xor     rdi, rdi
            syscall

K256:
    db 98H, 2FH, 8AH, 42H, 91H, 44H, 37H, 71H, 0CFH, 0FBH, 0C0H, 0B5H, 0A5H, 0DBH, 0B5H, 0E9H, 5BH, 0C2H, 56H, 39H, 0F1H, 11H, 0F1H, 59H, 0A4H, 82H, 3FH, 92H, 0D5H, 5EH, 1CH, 0ABH, 98H, 0AAH, 07H, 0D8H, 01H, 5BH, 83H, 12H, 0BEH, 85H, 31H, 24H, 0C3H, 7DH, 0CH, 55H, 74H, 5DH, 0BEH, 72H, 0FEH, 0B1H, 0DEH, 80H, 0A7H, 06H, 0DCH, 9BH, 74H, 0F1H, 9BH, 0C1H, 0C1H, 69H, 9BH, 0E4H, 86H, 47H, 0BEH, 0EFH, 0C6H, 9DH, 0C1H, 0FH, 0CCH, 0A1H, 0CH, 24H, 6FH, 2CH, 0E9H, 2DH, 0AAH, 84H, 74H, 4AH, 0DCH, 0A9H, 0B0H, 5CH, 0DAH, 88H, 0F9H, 76H, 52H, 51H, 3EH, 98H, 6DH, 0C6H, 31H, 0A8H, 0C8H, 27H, 03H, 0B0H, 0C7H, 7FH, 59H, 0BFH, 0F3H, 0BH, 0E0H, 0C6H, 47H, 91H, 0A7H, 0D5H, 51H, 63H, 0CAH, 06H, 67H, 29H, 29H, 14H, 85H, 0AH, 0B7H, 27H, 38H, 21H, 1BH, 2EH, 0FCH, 6DH, 2CH, 4DH, 13H, 0DH, 38H, 53H, 54H, 73H, 0AH, 65H, 0BBH, 0AH, 6AH, 76H, 2EH, 0C9H, 0C2H, 81H, 85H, 2CH, 72H, 92H, 0A1H, 0E8H, 0BFH, 0A2H, 4BH, 66H, 1AH, 0A8H, 70H, 8BH, 4BH, 0C2H, 0A3H, 51H, 6CH, 0C7H, 19H, 0E8H, 92H, 0D1H, 24H, 06H, 99H, 0D6H, 85H, 35H, 0EH, 0F4H, 70H, 0A0H, 6AH, 10H, 16H, 0C1H, 0A4H, 19H, 08H, 6CH, 37H, 1EH, 4CH, 77H, 48H, 27H, 0B5H, 0BCH, 0B0H, 34H, 0B3H, 0CH, 1CH, 39H, 4AH, 0AAH, 0D8H, 4EH, 4FH, 0CAH, 9CH, 5BH, 0F3H, 6FH, 2EH, 68H, 0EEH, 82H, 8FH, 74H, 6FH, 63H, 0A5H, 78H, 14H, 78H, 0C8H, 84H, 08H, 02H, 0C7H, 8CH, 0FAH, 0FFH, 0BEH, 90H, 0EBH, 6CH, 50H, 0A4H, 0F7H, 0A3H, 0F9H, 0BEH, 0F2H, 78H, 71H, 0C6H
