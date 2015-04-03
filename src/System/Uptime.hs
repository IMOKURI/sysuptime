
{-# LANGUAGE ForeignFunctionInterface #-}

module System.Uptime
( upTime
, sysUpTime
) where

import Foreign.C.Types
import Foreign.Marshal.Alloc
import Foreign.Ptr


foreign import ccall "procps/proc/sysinfo.h uptime" c_upTime :: Ptr CDouble -> Ptr CDouble -> CInt

upTime :: IO Int
upTime = do
  uptime_secs <- malloc :: IO (Ptr CDouble)
  idle_secs   <- malloc :: IO (Ptr CDouble)

  return $ fromIntegral $ c_upTime uptime_secs idle_secs


foreign import ccall "net-snmp/library/system.h get_uptime" c_getUpTime :: CLong

sysUpTime :: IO Integer
sysUpTime = return $ fromIntegral c_getUpTime


