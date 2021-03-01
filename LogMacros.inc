
private _LOG_file = {
    private _fileName = reverse _this;
    private _index = _fileName find "\";
    reverse (_fileName select [0,_index]);
};
private _LOG_prefix = "Antistasi";

//client logs
#define Log_Error true
#ifdef Log_Error
    #define Error(Message) diag_log ( str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Error_1(Message, A) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Error_2(Message, A,B) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Error_3(Message, A,B,C) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Error_4(Message, A,B,C,D) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Error_5(Message, A,B,C,D,E) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Error_6(Message, A,B,C,D,E,F) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Error_7(Message, A,B,C,D,E,F,G) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Error_8(Message, A,B,C,D,E,F,G,H) diag_log (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
#else
    #define Error(Message)
    #define Error_1(Message, A)
    #define Error_2(Message, A,B)
    #define Error_3(Message, A,B,C)
    #define Error_4(Message, A,B,C,D)
    #define Error_5(Message, A,B,C,D,E)
    #define Error_6(Message, A,B,C,D,E,F)
    #define Error_7(Message, A,B,C,D,E,F,G)
    #define Error_8(Message, A,B,C,D,E,F,G,H)
#endif

#define Log_Info true
#ifdef Log_Info
    #define Info(Message) diag_log ( str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Info_1(Message, A) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Info_2(Message, A,B) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Info_3(Message, A,B,C) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Info_4(Message, A,B,C,D) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Info_5(Message, A,B,C,D,E) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Info_6(Message, A,B,C,D,E,F) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Info_7(Message, A,B,C,D,E,F,G) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Info_8(Message, A,B,C,D,E,F,G,H) diag_log (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
#else
    #define Info(Message)
    #define Info_1(Message, A)
    #define Info_2(Message, A,B)
    #define Info_3(Message, A,B,C)
    #define Info_4(Message, A,B,C,D)
    #define Info_5(Message, A,B,C,D,E)
    #define Info_6(Message, A,B,C,D,E,F)
    #define Info_7(Message, A,B,C,D,E,F,G)
    #define Info_8(Message, A,B,C,D,E,F,G,H)
#endif

#ifdef Log_Debug
    #define Debug(Message) diag_log ( str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Debug_1(Message, A) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Debug_2(Message, A,B) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Debug_3(Message, A,B,C) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Debug_4(Message, A,B,C,D) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Debug_5(Message, A,B,C,D,E) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Debug_6(Message, A,B,C,D,E,F) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Debug_7(Message, A,B,C,D,E,F,G) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Debug_8(Message, A,B,C,D,E,F,G,H) diag_log (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
#else
    #define Debug(Message)
    #define Debug_1(Message, A)
    #define Debug_2(Message, A,B)
    #define Debug_3(Message, A,B,C)
    #define Debug_4(Message, A,B,C,D)
    #define Debug_5(Message, A,B,C,D,E)
    #define Debug_6(Message, A,B,C,D,E,F)
    #define Debug_7(Message, A,B,C,D,E,F,G)
    #define Debug_8(Message, A,B,C,D,E,F,G,H)
#endif

#ifdef Log_Trace
    #define Trace(Message) diag_log ( str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Trace_1(Message, A) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Trace_2(Message, A,B) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Trace_3(Message, A,B,C) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Trace_4(Message, A,B,C,D) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Trace_5(Message, A,B,C,D,E) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Trace_6(Message, A,B,C,D,E,F) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Trace_7(Message, A,B,C,D,E,F,G) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Trace_8(Message, A,B,C,D,E,F,G,H) diag_log (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
#else
    #define Trace(Message)
    #define Trace_1(Message, A)
    #define Trace_2(Message, A,B)
    #define Trace_3(Message, A,B,C)
    #define Trace_4(Message, A,B,C,D)
    #define Trace_5(Message, A,B,C,D,E)
    #define Trace_6(Message, A,B,C,D,E,F)
    #define Trace_7(Message, A,B,C,D,E,F,G)
    #define Trace_8(Message, A,B,C,D,E,F,G,H)
#endif

//server log
#define ServerLog_Error true
#ifdef ServerLog_Error
    #define ServerError(Message) ( str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_1(Message, A) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_2(Message, A,B) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_3(Message, A,B,C) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_4(Message, A,B,C,D) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_5(Message, A,B,C,D,E) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_6(Message, A,B,C,D,E,F) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_7(Message, A,B,C,D,E,F,G) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerError_8(Message, A,B,C,D,E,F,G,H) (str serverTime + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
#else
    #define ServerError(Message)
    #define ServerError_1(Message, A)
    #define ServerError_2(Message, A,B)
    #define ServerError_3(Message, A,B,C)
    #define ServerError_4(Message, A,B,C,D)
    #define ServerError_5(Message, A,B,C,D,E)
    #define ServerError_6(Message, A,B,C,D,E,F)
    #define ServerError_7(Message, A,B,C,D,E,F,G)
    #define ServerError_8(Message, A,B,C,D,E,F,G,H)
#endif

#define ServerLog_Info true
#ifdef ServerLog_Info
    #define ServerInfo(Message) ( str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_1(Message, A) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_2(Message, A,B) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_3(Message, A,B,C) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_4(Message, A,B,C,D) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_5(Message, A,B,C,D,E) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_6(Message, A,B,C,D,E,F) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_7(Message, A,B,C,D,E,F,G) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerInfo_8(Message, A,B,C,D,E,F,G,H) (str serverTime + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
#else
    #define ServerInfo(Message)
    #define ServerInfo_1(Message, A)
    #define ServerInfo_2(Message, A,B)
    #define ServerInfo_3(Message, A,B,C)
    #define ServerInfo_4(Message, A,B,C,D)
    #define ServerInfo_5(Message, A,B,C,D,E)
    #define ServerInfo_6(Message, A,B,C,D,E,F)
    #define ServerInfo_7(Message, A,B,C,D,E,F,G)
    #define ServerInfo_8(Message, A,B,C,D,E,F,G,H)
#endif

#ifdef ServerLog_Debug
    #define ServerDebug(Message) ( str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_1(Message, A) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_2(Message, A,B) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_3(Message, A,B,C) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_4(Message, A,B,C,D) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_5(Message, A,B,C,D,E) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_6(Message, A,B,C,D,E,F) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_7(Message, A,B,C,D,E,F,G) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerDebug_8(Message, A,B,C,D,E,F,G,H) (str serverTime + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
#else
    #define ServerDebug(Message)
    #define ServerDebug_1(Message, A)
    #define ServerDebug_2(Message, A,B)
    #define ServerDebug_3(Message, A,B,C)
    #define ServerDebug_4(Message, A,B,C,D)
    #define ServerDebug_5(Message, A,B,C,D,E)
    #define ServerDebug_6(Message, A,B,C,D,E,F)
    #define ServerDebug_7(Message, A,B,C,D,E,F,G)
    #define ServerDebug_8(Message, A,B,C,D,E,F,G,H)
#endif

#ifdef ServerLog_Trace
    #define ServerTrace(Message) ( str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_1(Message, A) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_2(Message, A,B) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_3(Message, A,B,C) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_4(Message, A,B,C,D) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_5(Message, A,B,C,D,E) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_6(Message, A,B,C,D,E,F) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_7(Message, A,B,C,D,E,F,G) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
    #define ServerTrace_8(Message, A,B,C,D,E,F,G,H) (str serverTime + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", name player, clientOwner]) remoteExec ["diag_log", 2]
#else
    #define ServerTrace(Message)
    #define ServerTrace_1(Message, A)
    #define ServerTrace_2(Message, A,B)
    #define ServerTrace_3(Message, A,B,C)
    #define ServerTrace_4(Message, A,B,C,D)
    #define ServerTrace_5(Message, A,B,C,D,E)
    #define ServerTrace_6(Message, A,B,C,D,E,F)
    #define ServerTrace_7(Message, A,B,C,D,E,F,G)
    #define ServerTrace_8(Message, A,B,C,D,E,F,G,H)
#endif
