
{-# LANGUAGE ForeignFunctionInterface #-}

module System.Uptime
( c_uptime
) where


foreign import ccall "procps/proc/whattime.h print_uptime" c_uptime :: IO ()


