TITLE SELECTION SORT ALGORITHM
; Author : Youssef Gamal
;------------------------------------------------------------------------
; Selection sort works by repeatedly finding the minimum element from unsorted part and moved to  
; the sorted part
; The algorithm maintains two subarrays 
; The subarray which is sorted
; remaining subarray which is unsorted
; Time complexity  worst case O(n^2)
; Space comlexity O(1)
;------------------------------------------------------------------------
.386
.MODEL FLAT
ExitProcess PROTO NEAR32 stdcall , dwExitCode:DWORD
INCLUDE io.h 
cr EQU 0dh
Lf EQU 0ah
.STACK 4096


.DATA

arr     DWORD 50,40,20,30,10
siz  =  ($-arr)/4  ;array size 
result  BYTE 11 DUP (?),cr,Lf,0
string  BYTE 20 DUP (?)
prm     BYTE "enter number : ",0


.CODE
_start:

comment !
;////////////////////////
; if you want to enter array elements    UNCOMMENT 
lea esi , arr
mov ecx,siz

_printARR
output prm
input string 
atod string 
mov [esi],eax
add esi,4
loop _printArr
;////////////////////////

!
lea ebx,arr
mov esi,0
_for:
cmp esi,[siz-1]
je end_for
mov ecx,esi

mov edi,esi
inc edi
_xfor:
cmp edi,siz
je end_xfor
mov edx,[ebx+ecx*4]
mov eax,[ebx+edi*4]
cmp eax,edx
jg ok
mov ecx,edi

ok:
inc edi
jmp _xfor


end_xfor:

mov eax,[ebx+esi*4]
xchg eax,[ebx+ecx*4]
mov [ebx+esi*4],eax


inc esi
jmp _for
end_for:

;////////////////////////////
; * Printing array elements 

lea esi , arr
mov ecx,siz

_printARR:
dtoa result,[esi]
output result
add esi,4
loop _printArr
;////////////////////////////

invoke EXITPROCESS,0 
PUBLIC _start
END
