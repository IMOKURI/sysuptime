
{-# LANGUAGE ForeignFunctionInterface #-}

module System.Uptime
( sysUpTime
) where

import Foreign.C.Types

foreign import ccall "get_uptime" c_getUpTime :: CLong

sysUpTime :: IO Integer
sysUpTime = return $ fromIntegral c_getUpTime


